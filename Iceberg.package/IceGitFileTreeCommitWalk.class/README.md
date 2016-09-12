Utility class for searching through a commit history taking advantage of git revwalk utilities.

Internal representation
- repository: an IceMCGitRepository from which I will be loading commits
- toShow: a list of commitishes from which I will start to look for commits (at least one is needed).
- to Hide: a list of commitishes that shouldn't appear in this walk (optional, but useful).
- limit: a number indicating the max number of results expected.
- package: restrict the output to commits that modify a certain package.