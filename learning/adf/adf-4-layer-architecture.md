Oracle ADF (Application Development Framework) is the "glue" of the Oracle Fusion Middleware stack. It is a Java EE framework that simplifies enterprise application development by providing a visual, declarative approach to building complex, data-centric web applications.

In a "Fusion" context, you are typically building a **Fusion Web Application**, which is designed to integrate seamlessly with Oracle's enterprise standards.

---

## 1. How It Works: The 4-Layer Architecture
ADF is based on the **Model-View-Controller (MVC)** design pattern, but it expands it into four distinct layers to ensure a clean separation of concerns.



### A. Business Services Layer (The Data)
This layer handles data persistence and business logic. The industry standard here is **ADF Business Components (ADF BC)**:
* **Entity Objects (EO):** Represent a database table and handle validation/DML.
* **View Objects (VO):** Represent a SQL query for the UI (the "data shape").
* **Application Modules (AM):** A transactional container that manages the VOs and EOs.

### B. Model Layer (The Connector)
The "secret sauce" of ADF. It uses **Data Controls** to abstract the Business Services. Instead of writing Java code to fetch data, you "bind" UI components directly to these Data Controls.

### C. Controller Layer (The Flow)
Unlike standard JSF, ADF uses **ADF Task Flows**. These are visual diagrams that define the "path" a user takes through an application.
* **Bounded Task Flows:** Reusable "mini-applications" with their own private memory scope.
* **Unbounded Task Flows:** The global entry points of the app.

### D. View Layer (The UI)
Powered by **ADF Faces**, a library of over 150 AJAX-enabled JSF components. These components are "smart"—they know how to talk to the Model layer via **EL (Expression Language)**.

---

## 2. Project Setup: Step-by-Step
To build an ADF project, you use **Oracle JDeveloper**. Here is the standard setup for a Fusion Web Application:

### Step 1: Initialize the Application
1.  Open JDeveloper and select **New Application** → **Fusion Web Application (ADF)**.
2.  **Naming:** This creates a workspace (`.jws`) with two default projects:
    * **Model:** Where your ADF Business Components live.
    * **ViewController:** Where your JSF pages and Task Flows live.

### Step 2: Define Database Connection
1.  Go to the **Resources Palette** and create a New Database Connection.
2.  Test the connection to ensure JDeveloper can talk to your schema.

### Step 3: Create Business Components
1.  Right-click the **Model** project → **New** → **Business Components from Tables**.
2.  Select your tables to automatically generate **Entity Objects** and **View Objects**.
3.  Add them to an **Application Module**.

### Step 4: Build the UI Flow
1.  In the **ViewController** project, open `adfc-config.xml` or create a new **ADF Task Flow**.
2.  Drag and drop **View** activities (pages) and **Control Flow Cases** (arrows) to define navigation.

### Step 5: Design Pages via Drag-and-Drop
1.  Create a `.jsf` page from the task flow.
2.  Open the **Data Controls** panel. 
3.  Drag a **View Object** (e.g., `EmployeesView`) onto the page and select "ADF Form" or "ADF Table." JDeveloper automatically writes the binding code for you.

---

## 3. Modern Trends (2026 Context)
While the core of ADF remains stable, the "Fusion" ecosystem has evolved:
* **Redwood UI:** Modern ADF development focuses on the **Redwood Design System**, Oracle's latest visual standard.
* **AI Integration:** Many 2026-era ADF apps now use REST Data Controls to call AI/ML microservices (like predictive analytics) directly from the Model layer.
* **Cloud-First:** Projects are increasingly deployed to **Oracle Cloud Infrastructure (OCI)** using automated CI/CD pipelines (Jenkins/GitLab) rather than manual WebLogic deployments.
