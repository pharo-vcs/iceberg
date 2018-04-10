I represent a repository commitish, in other words, an object that is or could be used as a commit.
I am an abstract class presenting the main API of my subclasses.

My main actions are

 - checkout: load all code of a commit into the working copy, and set itself as HEAD.
     aCommitish checkout.

 - checkoutPackageNamed: load the code of a package into the working copy, without setting HEAD.
     aCommitish checkoutPackageNamed: aPackageNameString.

 - merge: merge myself in the working copy
     aCommitish merge.

- switch: set myself as HEAD
    aCommitish switch.

I can also be queried for packages, ancestry and to make diffs to another commitishs:

 aCommitish packageNames.
 aCommitish diffTo: anotherCommitish.

 aCommitish commits.
 aCommitish newCommitWalk.