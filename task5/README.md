# Project Name

Task 5. Working with a Git repository and branches in Xcode.

# Description

This file contains the theoretical part for task 5 of lab work 5. It describes
basic Git operations available in Xcode.

# Installation

You need:

- Xcode with Source Control support enabled;
- a local Git repository;
- a remote repository on GitHub or another Git hosting service.

# Usage

Answers to task questions:

1. A local Git repository in Xcode can be created when you create a new project
   and enable `Create Git repository on my Mac`, or later through source
   control initialization for an existing project.
2. An external repository can be connected in two common ways:
   by cloning it through Xcode (`Clone Git Repository`) or by adding a remote
   to an existing local repository in Source Control / terminal and then opening
   the project in Xcode.
3. A branch can be created from the Source Control navigator or from the branch
   indicator in the toolbar by choosing `New Branch`.
4. A commit can be reverted through `Source Control -> Commit`, then using
   revert operations or by resetting to a previous commit/branch state in the
   history view.
5. Branches can be merged through `Source Control -> Merge from Branch` after
   selecting the target branch.

# Authors

Vanya Nasennik

# Links and Additional Notes

- In terminal, equivalent commands are `git init`, `git remote add`,
  `git checkout -b`, `git revert`, `git merge`
- The repository structure required by the lab is described in
  `docs/lab5/report.md`
