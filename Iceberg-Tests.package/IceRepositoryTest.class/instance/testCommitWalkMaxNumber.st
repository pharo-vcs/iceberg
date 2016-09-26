tests - commit walk
testCommitWalkMaxNumber
	| commits |
	commits := repository newCommitWalk 
		fromHead;
		maxNumber: 2;
		commits.

	self assert: commits size equals: 2