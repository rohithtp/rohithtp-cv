


### **The System Design Question**
> **"In a large-scale messaging app like WhatsApp, when a user sends a single message to a group containing 1,000 members, how does the system efficiently track and update the delivery/read status for every recipient without creating a database bottleneck or a 'hot row' scenario?"**

---

### **Why this question is asked**
Interviewers use this scenario to test your understanding of several high-level engineering concepts:

* **Fan-out Strategies:** How to distribute a single event to a massive number of subscribers.
* **Database Contention:** How to avoid multiple workers trying to write to the same row at the exact same time.
* **Asynchronous Processing:** Using message queues to handle tasks in the background so the sender isn't stuck waiting for 1,000 confirmations.
* **Data Sharding:** Distributing data across different physical servers (shards) based on user IDs to balance the load.

---

This is a classic system design question centered on **concurrency**, **fanout**, and **scalability**. Here is the content formatted in clean, professional Markdown for your documentation or study notes.

---

# System Design: WhatsApp Group Message Delivery
**The Problem:** You send 1 message to a group with 1000 members. How does the system handle delivery states without 1000 concurrent updates to a single row?

### **Short Answer**
It is **one logical message write**, followed by many **asynchronous fanout writes**. The system avoids 1000 concurrent updates to the same row by decoupling the message content from the delivery status.

---

## [1] Separate Message from Delivery State
A strong design avoids "hot rows" (rows that are frequently updated). Instead of storing the status for all 1000 users in one big row, the system splits the data into two layers:

* **Message Record:** One durable write for the actual content.
    * `message_id`, `group_id`, `sender_id`, `payload`, `timestamp`
* **Delivery State:** Separate per-recipient or per-recipient-bucket states.
    * Stored in inbox shards, fanout queues, or specific delivery tables.

**Result:** The payload is written once; delivery progress is tracked independently across many shards.

---

## [2] The Fanout Process
After the sender hits "send," the backend persists the message to the group message log. Then, a **fanout service** expands that message to the recipients. For 1000 members, this involves:

1.  **Enqueuing** delivery tasks per member (or per device).
2.  **Writing** to per-user inbox shards.
3.  **Pushing** immediately to online users.
4.  **Buffering** messages for offline or weak-connectivity users.

> **Key Takeaway:** This is not one single database write. It is **one core write** for the message and **many downstream writes** or queue appends, all handled asynchronously and partitioned across the infrastructure.

---

## [3] Handling Different Connectivity States
The system does not wait for all 1000 members to receive the message before finishing the sender's request. It lets delivery converge asynchronously:

| User Segment | Handling Strategy |
| :--- | :--- |
| **600 Online Users** | Pushed over existing connections; wait for client delivery ACK; update specific state. |
| **300 Weak Connectivity** | Attempt push; if it fails, the message is delayed/retried in a buffer; state remains "pending." |
| **100 Offline Users** | Message sits in their dedicated mailbox/pending queue until they reconnect. |

---

## [4] Why This Avoids "Hot Row" Updates
The design is **append-heavy** rather than update-heavy. Instead of 1000 workers fighting over one row, each worker writes to its own isolated space:

* Its own user inbox partition.
* Its own delivery queue.
* Its own recipient-state row or document.

### **Aggregating Progress**
If the sender needs to see a metric (e.g., *"Delivered to 742 members"*), the system derives this data from:
* Aggregated ACK counters.
* Batched receipt updates.
* Background aggregation services.

**Crucially, it does NOT rewrite one giant status blob every time a single recipient sends an acknowledgement.**