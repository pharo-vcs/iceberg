I represent an iceberg repository. I am an abstract class, my subclasses will represent concrete repositories such as monticello or git repositories. I define the main API and I have some common methods defined as template methods.

! Instantiation
Check my subclasses to know how to instantiate them.

! Basic  repository properties

All repositories have two main properties: a name and a working copy. 
 - name is used to identify a repository
 - the working copy is used to manage the status of all code loaded from the repository. See #IceWorkingCopy

! The repository HEAD

Moreover, every repository has to define a HEAD. The repository HEAD is a reference to our current working commit/branch in the repository.

  repository head.

The head can be either a branch or a commit. To access the current commit you can ask the head for its commit, or directly the repository for its headCommit (Yes, commits and branches are polymorphic, a commit returns self when asked for its commit).

  repository head commit.
  repository headCommit.

HEAD is an important concept inside iceberg. It is used to calculate if our code is synchronized, if we have commits to fetch and load, and so on...

Moreover, please notice that HEAD is a repository property, and it is completely separate from the image's state. The image can have code loaded from commits other than HEAD, and vice-versa. More of it is explained in IceWorkingCopy class comment.

! Branches

An iceberg repository natively  supports branches. To query the branches in the repository you can ask for:

  repository localBranches.
  repository remoteTrackedBranches.
  repository allBranches.

Other convenience methods also provide:

  repository localBranchNames.
  repository remoteBranchNames.

Take into account that such methods will return only already fetched branches. If the branch exists in a remote repository, you should need to do a #fetch before being able to see it.

Branches can also be queried by name, using the utility methods

  repository branchNamed: aName.
  repository branchNamed: aName ifAbsent: [ ... ].
  repository branchNamed: aName ifPresent: [ ... ].
  repository branchNamed: aName ifAbsent: [ ... ] ifPresent: [ ... ].

and the variant for remote branches.

  repository remoteBranchNamed: aName.
  repository remoteBranchNamed: aName ifAbsent: [ ... ].
  repository remoteBranchNamed: aName ifPresent: [ ... ].
  repository remoteBranchNamed: aName ifAbsent: [ ... ] ifPresent: [ ... ].

Branches can be created from a specific commit or, by default, from #headCommit.

  repository createBranch: aBranchName.
  repository createBranch: aBranchName inCommit: aCommit.

Notice that creating a branch will switch to it automatically.

The variant #ensureBranch: will create a branch only if a branch with the same name does not exist.

  repository ensureBranch: aBranchName.

Also, to create a branch tracking a remote branch (that is, that will start from the same commit and follow the evolution of a remote branch), you can use #createBranchTracking: aBranchName.

Finally, to switch to an existing branch:

  repository switchToBranchNamed: aBranchName.

! Remotes

Remotes are references to remote repositories. Remotes are used for pulling and pushing commits and branches.
Remotes can be added using the #addRemote: message and removed using the remoteRemote: message . However, thou shall be careful, remotes should be created from the class corresponding to the repository. For example, git repositories should use git remotes, and so on. Check IceRemote and its concrete subclasses.

  repository addRemote: aRemote.

Once remotes are configured, we can configure them as pull remote and push remote. A pull remote is a remote used for pulling commits by default, while a push remote is a remote used for pushing new commits by default.

  repository pullRemote: aRemote.
  repository pushRemote: aRemote.

  repository isPullRemote: aRemote.
  repository isPushRemote: aRemote.

If pull or push remotes are not configured, they will default to 'origin'. Origin is a well known remote, for which an accessor to the 'origin' remote  is provided through the #origin message.

  repository origin.

Remotes can be queried with:

  repository remotes.
  repository remoteNamed: aName.
  repository remoteNamed: aName ifAbsent: [ ... ].

Moreover, we can query if the current branch has commits to be uploaded using the #outgoingCommits and friends, or if the current branch has commits to be downloaded using the #ingoingCommits and friends.

  repository hasIncomingCommits.
  repository incomingCommits.
  repository hasIncomingCommitsFrom: aRemote.
  repository incomingCommitsFrom: aRemote.

  repository hasOutgoingCommits.
  repository outgoingCommits.
  repository hasOutgoingCommitsTo: aRemote.
  repository outgoingCommitsTo: aRemote.

Finally, we can interact with remotes via the fetch, pull and push operations.
Fetch downloads new commits and branches from the specified remote.
Pull and push operations delegate to pull and push of the current branch. Check IceLocalBranch.

  repository fetch.
  repository pull.
  repository push.

! Committing code

Once modifications are done, we can commit them to the repository using the commit* messages. The main API for it is #commitWithMessage: that will commit all changes with the given commit.

  repository commitWithMessage: 'aMessage in a string'.

A second commit message is also available to commit cherry picks:

  repository commitCherryPick: aChangesList withMessage: ' a message in a string'.

NOTICE that commits can only be done if the following is true:

 - HEAD is a branch
 - the working copy reference commit is the same commit as #headCommit

In any other case, commits are forbidden as they may break the repository consistency.

! Loading code & Package querying

From the repository point of view, only some convenience methods are provided to checkout all code from the current branch, unload all loaded code, know what packages are loaded or modified. Please refer to IceWorkingCopy for a more complete API.

