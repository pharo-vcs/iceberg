I represent and manage all code that is loaded in the current image. My main responsibilities are the bookeeping of loaded packages, the loaded commits, the modification and diffs, and the main entry point for committing code.

! Adding and Loading Packages

Adding a working copy to a repository is achieved by the message addPackageNamed:

  repository addPackageNamed: aPackageNameString.

I can be later on queried using the following messages

  repository includesPackageNamed: aPackageNameString.
  repository isLoadedPackageNamed: aPackageNameString.

  repository packageNames.

Packages already in a repository can be loaded and unloaded with:

  repository checkoutPackageNamed: aPackageNameString.
  repository unloadPackageNamed: aPackageNameString.

And queried with:

  repository loadedPackages.

! The Working Copy State

The working copy can be in different states depending on the repository and the package. It is the working copy state reponsibility to decide wether we can commit, if we are on a merge, and so on... The working copy state can be obtained through the message #workingCopyState.

  workingCopy workingCopyState.

The working copy state is calculated every time that it is called. This is because the state of the repository can be modified from outside the system (e.g.,  the command line or another tool). In any case, calculating the working copy state is fast enough to be executed on-line even for big repositories such as Pharo's. The working copy state is calculated from the status of each of its packages. It was decided like this because it may happen that somebody downloads a package from different commits. If this situation changes in the future, this is a good point for simplification.

Working copy states are instances of IceWorkingCopyState. Check it and its subclasses for more information.

! The Current Commit(s)

A crucial information bookeept by the working copy is the current loaded commit(s). Indeed, depending on the state of the packages and the loaded code, there may be a single current commit or several:

 - having a single commit means that all loaded packages were loaded from the same commit
 - having multiple commits mean that we are in a merge situation
 - having no commit means that no packages were loaded or that they were loaded from another mechanism such as monticello 

In general terms, the current commit should not be accessed directly.

The following methods allow for testing and accessing the current commits:

  repository hasSingleCommit.
  repository hasUnknownCommit.
  repository isInMerge.

  repository referenceCommit.
  repository referenceCommits.

!  Changes and Committing

The working copy bookkeeps the loaded packages and their state and thus it provides methods to query and commit those changes into the repository.

  repository modifiedPackages.
  repository isModified.

  repository commitWithMessage: aMessageString.
  repository commitChanges: aListOfChanges withMessage: aMessagString.
  repository commitPackages: aListOfPackages withMessage: aMessageString.

NOTICE that commits can only be done if the following is true:

 - repositroy HEAD is not detached (i.e., it is a branch)
 - I am not detached. I.e., my reference commit (in case of a merge, it should be the first one) is the same commit as #headCommit

Such validations can be verified with the following messages

  repository validateCanCommit.
  repository isDetached.

!  Merging

The main entry point for merging a commit is the working copy, through the method #mergeCommit:. This method will, delegating to the working copy state, verify that the commit needs to be merged, can be merged, and if it has conflicts. In case there are no conflicts an automatic merge will be issued by default.

  workingCopy mergeCommit: aCommit.

IMPORTANT IMPLEMENTATION NOTE. The version information and commits are so far stored inside MCWorkingCopy and co. Check #updatePackage:toCommits: