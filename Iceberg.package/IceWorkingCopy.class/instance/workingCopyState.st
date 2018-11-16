accessing
workingCopyState
	"The working copy can be in different states depending on the repository and the package. It is the working copy state reponsibility to decide wether we can commit, if we are on a merge, and so on... The working copy state can be obtained through the message #workingCopyState.

  workingCopy workingCopyState.

The working copy state is calculated every time that it is called. This is because the state of the repository can be modified from outside the system (e.g.,  the command line or another tool). In any case, calculating the working copy state is fast enough to be executed on-line even for big repositories such as Pharo's. The working copy state is calculated from the status of each of its packages. It was decided like this because it may happen that somebody downloads a package from different commits. If this situation changes in the future, this is a good point for simplification."

	"This method obtains the head commit once and sends it as argument as an optimization.
	This is because asking for the head commit is expensive.
	
	Check the commits of #packageState"

	referenceCommit isCollection
		ifTrue: [ ^ IceInMergeWorkingCopy repository: repository ].
	referenceCommit isUnknownCommit
		ifTrue: [ ^ IceUnknownVersionWorkingCopy repository: repository ].
	referenceCommit isNoCommit
		ifTrue: [ ^ IceEmptyWorkingCopy repository: repository ].
	^ IceAttachedSingleVersionWorkingCopy repository: repository