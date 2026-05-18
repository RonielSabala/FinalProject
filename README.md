# ThesisHub

ThesisHub is a web application built with **C#** and **ASP.NET MVC** to register, manage, and monitor university theses. It provides a workflow for students to submit thesis files, tutors to review and comment on submissions, and administrators to manage the thesis lifecycle and users.

---

## Table of Contents

- [Features](#features)
- [Architecture \& Data Model](#architecture--data-model)
- [Quick Start](#quick-start)
  - [Requirements](#requirements)
  - [Database Setup](#database-setup)
- [Run Locally](#run-locally)
- [Contributing](#contributing)
- [License](#license)

---

## Features

- Register and manage theses, students, tutors, and departments.
- Assign tutors to theses with roles (`Advisor`, `Co-Advisor`).
- Upload multiple document links per thesis.
- Tutors review and comment on documents.
- Track thesis lifecycle statuses: `Open`, `Closed`, `Approved`, `Rejected`.
- Admin dashboard to view theses by status and assigned tutors.

---

## Architecture & Data Model

Primary entities and relationships:

- A `Department` has many `Students` and many `Tutors`.
- A `Student` can create many `Theses`.
- A `Thesis` belongs to a `Student`, has many `Documents`, and connects to `Tutors` via `ProjectTutors`, which stores the `tutor_role`.
- A `Document` belongs to a single `Thesis` and is owned by a `Student`.
- A `Tutor` can be assigned to many `Theses` and can comment on `Documents`.
- A `Comment` is attached to a `Document` and authored by a `Tutor`.

> For the full ER diagram, see [`docs/ER-diagram.pdf`](docs/ER-diagram.pdf).

---

## Quick Start

### Requirements

| Tool                                                                                            | Version    |
| ----------------------------------------------------------------------------------------------- | ---------- |
| [.NET SDK](https://dotnet.microsoft.com/en-us/download/visual-studio-sdks)                      | >= 9.0     |
| [Visual Studio](https://visualstudio.microsoft.com/es/downloads/)                               | Any recent |
| [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (Express or full) | Any recent |
| [sqlcmd](https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-download-install)            | >= 1.10.0  |

---

### Database Setup

From the **repo root**:

```bash
sqlcmd -S .\SQLEXPRESS -i database/creation.sql
sqlcmd -S .\SQLEXPRESS -i database/insertions.sql
```

This creates the required tables and inserts sample data so you can start using the app immediately.

---

## Run Locally

1. Open the solution in Visual Studio.
2. Right-click the solution and select **Configure Startup Projects**.
3. Choose **Multiple startup projects** and set both `ThesisHub.Web` and `ThesisHub.API` to **Start**.
4. Save and press **F5**.

Visual Studio will launch both projects and open their configured URLs.

---

## Contributing

Contributions are welcome. Suggested workflow:

1. Fork the repository.
2. Create a feature branch: `feat/my-change`.
3. Make your changes following the existing code style.
4. Include appropriate documentation or tests.
5. Commit, push, and open a pull request describing the change and the reason for it.

---

## License

This project is available under the **MIT License**.
