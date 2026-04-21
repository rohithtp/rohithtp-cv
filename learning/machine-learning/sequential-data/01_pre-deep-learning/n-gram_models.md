Before the rise of Recurrent Neural Networks (RNNs) and the modern deep learning explosion, handling sequential data—like text, speech, or stock prices—was a game of clever feature engineering and statistical modeling.

Since neural networks weren't yet capable of "remembering" past inputs effectively, researchers relied on methods that either ignored time or treated it as a fixed mathematical constraint.

---

## 1. N-Gram Models (The Statistical Approach)
In Natural Language Processing (NLP), **N-grams** were the gold standard. Instead of understanding context, these models predicted the next word based purely on the frequency of the $n$ preceding words.
* **Unigrams ($n=1$):** Treated words as independent (Bag of Words).
* **Bigrams ($n=2$):** Looked only at the previous word.
* **The Limitation:** They had a "short memory." If you needed information from ten words back to understand a sentence, an N-gram model was essentially blind.

## 2. Hidden Markov Models (HMMs)
Before RNNs dominated speech recognition, **Hidden Markov Models** were the kings of the field. An HMM assumes that the system is a Markov process with unobserved (hidden) states.
* **How they worked:** They calculated the probability of transitioning from one state to another (e.g., from the "noun" state to the "verb" state).
* **The Limitation:** They rely on the **Markov Property**, which assumes the future depends only on the *current* state, not the sequence of events that came before it. This made complex, long-term dependencies very difficult to capture.



## 3. Feedforward Neural Networks (MLPs)
In the early days of neural nets, we used **Multi-Layer Perceptrons (MLPs)**. However, these have a fixed input size. 
* **The "Window" Method:** To handle sequences, engineers used a "sliding window." If you wanted to predict the next word, you’d feed the network a fixed block of the last five words.
* **The Limitation:** If the "clue" to the sequence fell outside that five-word window, the network couldn't see it. Also, the weights weren't shared across time steps, making the models inefficient.

## 4. Classic Signal Processing & Rule-Based Systems
In many fields, we didn't use "learning" at all:
* **Symbolic AI:** Using massive sets of "if-then" rules written by linguists to parse language.
* **Hand-crafted Features:** In speech or audio, experts would manually extract **MFCCs** (Mel-frequency cepstral coefficients) and use logic-based decoders to turn sounds into text.

---

### Comparison Table: Pre-RNN vs. RNN

| Feature | Pre-RNN Era (HMMs/N-Grams) | RNN Era |
| :--- | :--- | :--- |
| **Memory** | Very short (fixed window or Markovian) | Theoretically infinite (hidden state) |
| **Input Length** | Usually fixed | Variable |
| **Feature Engineering** | Heavy (hand-crafted by experts) | Learned automatically from raw data |
| **Complexity** | Mathematically rigid | Computationally intensive |

Essentially, the pre-RNN era was defined by **human intuition**. We had to tell the machines exactly what patterns to look for. RNNs (and eventually LSTMs and Transformers) shifted that burden, allowing the models to discover the temporal patterns themselves.