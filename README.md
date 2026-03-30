# Project Name

Laboratory Work 5. Objective-C and Swift console applications.

# Description

This repository contains materials for laboratory work 5 in the course
`Технологии программирования для мобильных приложений`.

Variant used for the implementation: `6`.

Implemented tasks:

- `task1` — Xcode and iOS Simulator familiarization notes;
- `task2` — Objective-C app for the sum of the first `k` Fibonacci numbers;
- `task3` — Objective-C app for array processing and maximum search;
- `task4` — Swift REPL / `swiftc` / Playground palindrome task;
- `task5` — Git and branching notes for Xcode;
- `task6` — Swift Package Manager dictionary processing app;
- `task7` — Swift MVC array processing app.

The detailed report is published in
[`docs/lab5/report.md`](./docs/lab5/report.md).

# Installation

Objective-C tasks:

```sh
cd task2 && make
cd task3 && make
```

Swift task 4:

```sh
cd task4
swiftc palindrome.swift -o palindrome_checker
```

Swift Package Manager tasks:

```sh
cd task6 && swift build
cd task7 && swift build
```

# Usage

Quick start commands:

```sh
cd task2 && ./fibonacci_app
cd task3 && ./array_app
cd task4 && ./palindrome_checker
cd task6 && swift run Task6App
cd task7 && swift run Task7App
```

Recommended repository branch layout for publication:

- `main` — top-level `README.md` and report link;
- `feature-task2` — task 2 source code in `task2/`;
- `feature-task3` — task 3 source code in `task3/`;
- `feature-task4` — task 4 source code in `task4/`;
- `feature-task6` — task 6 source code in `task6/`;
- `feature-task7` — task 7 source code in `task7/`.

# Authors

Vanya Nasennik

# Links and Additional Notes

- Report: [`docs/lab5/report.md`](./docs/lab5/report.md)
- Task 1 notes: [`task1/README.md`](./task1/README.md)
- Task 5 notes: [`task5/README.md`](./task5/README.md)
