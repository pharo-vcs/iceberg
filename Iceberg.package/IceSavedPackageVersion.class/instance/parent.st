exploring
parent
	| startCommitId |
	startCommitId := commitId ifNotNil: [ commitId ] ifNil: [ updationCommit id ].

	^ (self repository newCommitWalk 
		fromCommitId: startCommitId; 
		modifyingPackage: self package;
		maxNumber: 2;
		commits)
		second "First commit will be my own commit, the second is my parent"
		versionFor: self package.