Git Merge processing is implemented in Pharo, so it can:
 - detect a fast forward merge and avoid the creation of extra merge commits
 - offer a single UI to resolve all conflicts of a project in one go (and not one per package)

Iceberg's merge happens completely in memory because using Git's default merge mechanism would insert the >>>> <<<< markers in any conflicting files and break our parsers and tools.
Instead, we ask git for the list of conflicting files, and we build a diff tree in memory, that we later augment with information such as conflicts.

## Issues
There are some issues we have seen when merging external files, where two merged commits were not merging external files, but we hope we will fix this soon.

## Missing features
 
- we can only choose between incoming or loaded version during a merge. It would be nice to be able to edit a method's code, picking part of the incoming code and part of the current code.

- we resolve all conflicts in memory and commit them at once. We know some people would like to, instead, not do the merge automatically, so they can test it before committing. This should not be tooo difficult to do but it was down in the priority list :).

## Basic Demo


This [video](https://www.youtube.com/watch?v=DBzkjwABPEI) shows a simple example of how to branch, merge and checkout different commits.
We first create a new class with a method, then we create another branch and force a conflict. We resolve the conflict during merge.

In the middle, as a bonus feature, we checked out a commit and stayed with a Detached HEAD for a while ;)