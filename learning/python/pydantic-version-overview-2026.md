The name "Pydantic" is a portmanteau of "Py" and "pedantic." The "Py" part indicates that the library is associated with Python, and "pedantic" refers to the library's meticulous approach to data validation and type enforcement.

As of April 2026, Pydantic has continued to evolve as the industry standard for Python data validation. Below are the current version details and the state of the ecosystem.

---

## Current Stable Versions
If you are starting a new project or updating an old one, these are the versions you'll likely encounter:

* **Main Package:** `pydantic` **v2.13.0** (Current stable)
* **Legacy/Maintenance:** `pydantic` **v1.10.26** (Security and critical bug fixes only)
* **Internal Engine:** `pydantic-core` **v2.45.0** (The Rust-based validation engine)

### Check Your Installed Version
You can quickly check which version you are running in your terminal or script:

```python
import pydantic
print(pydantic.__version__)
```

---

## Key Differences: V1 vs. V2
The jump from Version 1 to Version 2 was a "ground-up" rewrite. If you are seeing old tutorials, they might use V1 syntax which is significantly different.

| Feature | Pydantic V1 | Pydantic V2 (Latest) |
| :--- | :--- | :--- |
| **Engine** | Pure Python | **Rust** (`pydantic-core`) |
| **Performance** | Standard | Up to **20x faster** |
| **Model Method** | `model.dict()` | `model.model_dump()` |
| **JSON Export** | `model.json()` | `model.model_dump_json()` |
| **Config** | `class Config:` | `model_config = ConfigDict(...)` |

---

## Important Ecosystem Update: Pydantic AI
In late 2025/early 2026, the team released **Pydantic AI**, which has quickly become a standard for building production-grade LLM applications. 

* **Current Version:** `pydantic-ai` **v1.77.0**
* **Focus:** Structured outputs for LLMs, agentic workflows, and native integration with models like Gemini 3 and GPT-5.

---

## Installation Commands
To get the latest version of Pydantic and its AI extensions:

* **Standard Pydantic:**
    `pip install -U pydantic`
* **Pydantic AI (for LLM work):**
    `pip install pydantic-ai`
* **Pinned V1 (if your legacy code requires it):**
    `pip install "pydantic<2.0.0"`

> **Pro Tip:** If you are migrating a large codebase from V1 to V2, you can use the `pydantic.v1` module to keep your old code running while you transition other parts of the system to the newer, faster V2 syntax.

Pydantic **v3.0.0** was officially released in late **2025**, with the current stable version being **v3.1.0** as of April 2026.

This release represents a significant shift from the v2 architecture, focusing heavily on **"Type-First" validation** and deep integration with the **Pydantic AI** ecosystem.

---

## What’s New in Pydantic v3?

While Pydantic v2 introduced the Rust-based engine (`pydantic-core`), v3 refines that engine to handle the massive scale required by modern LLM applications.

### 1. Blazing Fast "JIT" Validation
V3 introduces a Just-In-Time (JIT) compilation step for schemas. The first time a model is used, Pydantic compiles a highly optimized validation routine in Rust specifically for that model's shape, making it roughly **30%–50% faster** than v2 for complex, nested data.

### 2. Enhanced LLM Compatibility (Structured Outputs)
V3 was designed alongside **Pydantic AI**. It includes:
* **Native Tool/Function calling:** Models can now be converted directly into LLM tool schemas with better support for "Reasoning" fields.
* **Streaming Validation:** A new `model_validate_stream()` method that validates JSON chunks as they arrive from an LLM, allowing you to catch validation errors before the model even finishes typing.

### 3. Strict Mode by Default
In v3, "Strict Mode" is the default for many types. While v2 would often coerce a string `"123"` into an integer `123`, v3 encourages explicit types to prevent the "hallucination" of data types common in AI-generated responses.

### 4. Simplified Configuration
The `ConfigDict` introduced in v2 has been further streamlined. You can now define most behaviors using Python's `Annotated` syntax, reducing the need for the `model_config` class entirely.

---

## Migration & Support
If you are coming from v2, the breaking changes are significantly less painful than the v1-to-v2 jump.

* **Deprecations Removed:** All methods deprecated in v2 (like the old `dict()` and `json()` methods) have been fully removed in v3.
* **Python Version:** V3 requires **Python 3.10+**, fully embracing modern features like `match` statements and the pipe `|` operator for unions.

## Comparison Table

| Feature | Pydantic v2 | Pydantic v3 (Current) |
| :--- | :--- | :--- |
| **Engine** | Rust Static | **Rust JIT (Optimized)** |
| **Min Python** | 3.8 | **3.10** |
| **LLM Tools** | Via wrappers | **Native Integration** |
| **Validation** | Eager | **Streaming & Eager** |
| **Coercion** | Lax by default | **Strict by default** |

