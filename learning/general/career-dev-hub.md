To manage a repository for your study and CV using the Codex CLI, the choice depends on your hardware and how much "agentic" heavy lifting you want the model to do.

Based on the models you have, here is the best recommendation:

### **The Winner: `devstral:latest` (14 GB)**
This is your best option for repository management.
* **Why:** `devstral` (Mistral's code-focused model) is specifically optimized for **agentic software engineering**. Unlike a standard model that just completes code, Devstral is trained to understand repository structures, edit multiple files, and use tools.
* **Codex Fit:** The Codex blog specifically recommends models with a large context window (32K+). Devstral fits this requirement perfectly, allowing it to "read" your CV and study files together to ensure consistency.
* **Performance:** At 14 GB, it strikes the best balance between reasoning depth and local performance.

---

### **The Alternatives**

| Model | Use Case | Recommendation |
| :--- | :--- | :--- |
| **`mistral-small:latest`** | General Tasks | Great for writing the *content* of your CV or study notes, but lacks the specialized "agentic" training of Devstral for repo-level commands. |
| **`starcoder2:3b`** | Low Resource | Use this only if you are on a very limited machine (e.g., 8GB RAM). It’s fast but will struggle with complex repository logic or multi-file reasoning. |
| **`mistral:7b`** | Basic Coding | A solid all-rounder, but since you already have the 14 GB `devstral`, there is no reason to use this for Codex tasks. |

### **How to use it with Codex**
Since Codex defaults to `gpt-oss:20b`, you should explicitly point it to your Devstral model:

```bash
# Start Codex using your local Devstral model
codex --oss -m devstral:latest
```

**Pro-tip for your CV:** If you are using Codex to automate updates to your CV (e.g., "update my experience section based on this new project"), `devstral` will be much better at maintaining the Markdown or LaTeX formatting than the smaller 3B or 7B models.


### Follow up
```
/my-profile-repo
├── .codex/                # Codex configuration and logs
├── study-vault/
│   ├── software-eng/      # Notes on system design, AI, etc.
│   ├── coding-practice/   # Scripts and code snippets
│   └── research/          # Links and summaries of blogs (like the Ollama one)
├── portfolio/
│   ├── project-a/         # Documentation for specific builds
│   └── project-b/
└── profile-manifest.md    # The "brain" of the repo (Content below)
```


### **Manifest File Content (`profile-manifest.md`)**
Use this file as a central index. When you use Codex, you can tell it to "refer to the manifest" to understand where everything is.

```markdown
# Career & Study Manifest

## 🎯 Current Focus
- **Role:** Software Developer / AI Engineer
- **Studies:** LLM Architectures, Open-Source Tools, Python Backend
- **Tooling:** Ollama (Devstral), Codex CLI

## 📂 Repository Index
- [Master CV](./current-cv/nia-cv-tech.md) - Updated: 2026-04-08
- [Study Logs](./study-vault/) - Active notes on new technologies
- [Ollama Research](./study-vault/research/ollama-codex-integration.md) - Summary of the Codex integration blog

## 🛠 Automation Commands (for Codex)
- `update-cv`: Use recent study logs to add new skills to CV.
- `summarize-study`: Create a 3-bullet summary of the last 3 study files.
```

### **Why this works for Codex + Devstral**
1.  **Context Mapping:** By having a `profile-manifest.md`, you can give Codex a "starting point" so it doesn't have to scan every single file to find your CV.
2.  **Modularized Content:** Keeping your study notes separate from your CV prevents the model from accidentally injecting "messy" notes into your professional document.
3.  **Scalability:** As you add more projects or study topics, you only need to update the manifest, and Devstral will follow the paths you've laid out.

**Usage Tip:** When you're ready to update your CV with what you've learned, you can run:
`codex --oss -m devstral:latest "Read study-vault/research/ollama-codex.md and add 'Ollama-Codex Integration' to the skills section of current-cv/nia-cv-tech.md"`