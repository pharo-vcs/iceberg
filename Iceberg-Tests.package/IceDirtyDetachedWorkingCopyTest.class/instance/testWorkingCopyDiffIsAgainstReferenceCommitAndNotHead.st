tests
testWorkingCopyDiffIsAgainstReferenceCommitAndNotHead

	self assert: self repository workingCopyDiff targetVersion equals: self repository workingCopy referenceCommit.
	self deny: self repository workingCopyDiff targetVersion equals: self repository headCommit.