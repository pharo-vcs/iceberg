tests
testCleanWorkingCopyIsClean

	| status |
	status := IceCleanWorkingCopy on: repository.
	self assert: status isCleanWorkingCopy.