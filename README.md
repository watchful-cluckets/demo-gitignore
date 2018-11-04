# Purpose

This repo is designed to show someone how to ignore irrelevant files
in a git maintained repository. The steps in the demo are simple:

1. Add `relevant` and `irrelevant` files to the repo.
2. Add `irrelevant` files to the `.gitignore` file.
3. Commit and push all changes to the repo.

# Usage

## Setup

Clone this repo and simply run:
```bash
$ sh setup.sh
```

## Ignore Files

Notice that these new dirs and files are seen by `git`:
```bash
$ git status

On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	IRRELEVANT.file1
	IRRELEVANT.file2
	IRRELEVANT.file3
	IRRELEVANT_dir/
	relevant.file1
	relevant.file2
	relevant.file3
	relevant_dir/

nothing added to commit but untracked files present (use "git add" to track)
```

Open `.gitignore` in a text editor and add the `IRRELEVANT` directory and
files so that the file looks like this:
```emacs
IRRELEVANT_dir
IRRELEVANT.*
```

Check that the files are now ignored:
```bash
$ git status

On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   .gitignore

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	relevant.file1
	relevant.file2
	relevant.file3
	relevant_dir/

no changes added to commit (use "git add" and/or "git commit -a")
```

## Commit Changes

You are now free to add-commit the dirs and files without fear of
including content you do not want in the repo:
```bash
$ git add .
$ git commit -am "Updated gitignore to ignore IRRELEVANT files and dirs"
$ git push -u origin <your-branch-name>
```

## Clean-up

If you'd like to remove the files created:
```bash
$ sh cleanup.sh
```

# Allowing Empty Commits

In case I get this error message again:
```bash
$ git commit -am "Added demo files"

fatal: ambiguous argument 'junkfile': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
```

You fix it by allowing empty commits:
```bash
$ git commit --allow-empty -n -am "<some message>"
```
