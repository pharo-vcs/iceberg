accessing
commitId
	^ commitId ifNil: [ commitId := 
		(self repository newCommitWalk 
			fromCommit: self updationCommit;
			modifyingPackage: self package;
			firstCommit)
			id
	]