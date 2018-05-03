tests
testInstallBaselineWithConflictingRepositoryInDiskThrowsError

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.
	repository unload; forget.
	
	self installBaseline