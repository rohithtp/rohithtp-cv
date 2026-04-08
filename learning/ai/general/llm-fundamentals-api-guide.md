Welcome to the world of LLMs. To build effective AI applications, you need to understand how these models "think" and how to control them via code.

---

## 1. LLM Core Concepts

### **Tokens: The Currency of LLMs**
LLMs don't read words; they read **tokens**. A token can be a whole word, a part of a word (like "ing"), or even a single character.
* **Rule of Thumb:** 1,000 tokens is roughly **750 words**.
* **Why it matters:** APIs charge you per token, and models have a maximum limit on how many tokens they can process at once.

### **Context Window: The "Short-Term Memory"**
The context window is the total number of tokens a model can consider at one time (including your prompt and its own previous responses).
* **The Limit:** If a model has a 128k context window (like GPT-4o), it can "remember" a book's worth of text.
* **Overflow:** If your conversation exceeds this limit, the model starts "forgetting" the earliest parts of the chat.

### **Temperature: Randomness vs. Determinism**
Temperature ($T$) is a hyperparameter that scales the probabilities of the next token.
* **Low ($T \approx 0$):** Focuses on the most likely token. Best for factual tasks, data extraction, and **JSON output**.
* **High ($T \approx 0.7 - 1.2$):** Increases variety and "creativity." Best for brainstorming or creative writing.



---

## 2. Getting Structured JSON (The API Way)

Modern APIs have moved beyond just "asking nicely" for JSON. They now offer **Structured Outputs**, which guarantee the response will match your schema.

### **Example: OpenAI (Python)**
OpenAI uses the `response_format` parameter. Using **Pydantic** is the cleanest way to define your structure.

```python
from openai import OpenAI
from pydantic import BaseModel

client = OpenAI(api_key="your_key_here")

# 1. Define your structure
class MovieReview(BaseModel):
    title: str
    sentiment: str
    score_out_of_10: int

# 2. Call the API
completion = client.beta.chat.completions.parse(
    model="gpt-4o-2024-08-06",
    messages=[
        {"role": "system", "content": "Extract movie info into JSON."},
        {"role": "user", "content": "I absolutely loved 'Inception', it was a 9/10 masterpiece!"}
    ],
    response_format=MovieReview, # Forces the model to follow the class
    temperature=0 # Keep it low for structural tasks
)

# 3. Access the data directly as an object
review = completion.choices[0].message.parsed
print(f"{review.title}: {review.score_out_of_10}/10")
```

### **Example: Anthropic (Claude)**
Anthropic uses a similar approach called **Tool Use** (or "Function Calling") to force JSON, though they recently added a dedicated `output_format`.

```python
import anthropic

client = anthropic.Anthropic(api_key="your_key_here")

message = client.messages.create(
    model="claude-3-5-sonnet-20240620",
    max_tokens=1024,
    system="You are a data extractor. Always output valid JSON.",
    messages=[
        {"role": "user", "content": "Extract the name and age: John is 30 years old."}
    ],
    # Telling Claude to use a specific tool ensures structured output
    tools=[{
        "name": "print_user_info",
        "description": "Prints user info",
        "input_schema": {
            "type": "object",
            "properties": {
                "name": {"type": "string"},
                "age": {"type": "integer"}
            },
            "required": ["name", "age"]
        }
    }],
    tool_choice={"type": "tool", "name": "print_user_info"} # Forces Claude to use this tool
)

print(message.content[0].input) # Result: {'name': 'John', 'age': 30}
```

---

## **Summary Table**

| Feature | Low Setting | High Setting |
| :--- | :--- | :--- |
| **Temperature** | Predictable, focused, factual. | Random, creative, diverse. |
| **Tokens** | Cheaper, faster. | More expensive, slower. |
| **JSON Success** | High (with Structured Outputs). | Low (likely to hallucinate syntax). |

