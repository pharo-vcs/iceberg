tests
testInstallBaselineWithConflictingUnrelatedRepositoryInDiskThrowsError

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self createConflictingRepositoryIn: IceLibgitRepository localRepositoriesLocation/ 'pharo-vcs' / self repositoryName.

	self should: [ self installBaseline ] raise: IceMetacelloDuplicatedNotification