tests
testInstallBaselineWhileMissingRepositoryIsInstalledIsPossible

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self createConflictingRepository.
	conflictingRepository location: nil.

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository workingCopy isModified equals: self shouldBeDirty