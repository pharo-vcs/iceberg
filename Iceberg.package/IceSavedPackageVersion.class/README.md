A version of a package as saved in a repository. We have one of this for each commit in a repository which modifies the specified package.

Internal representation
- commit is the commit where this version was created (i.e. where the code was originally commited), can be unknown at creation time, once known will not change.
- updationCommit is the last commit loaded which is known to not have modifications for this package. Can be updated each time we load a new commit.

Loading the code from commit or updationCommit will return exactly the same code, the original commit is only needed to provide the user with more information when deciding to update or not a version with a newer one.