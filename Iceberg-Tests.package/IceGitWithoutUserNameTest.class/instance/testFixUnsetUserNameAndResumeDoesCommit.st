tests
testFixUnsetUserNameAndResumeDoesCommit
	| before after |
	(self repository getConfigurationGlobal: false) unset: 'user.name'.
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	before := self repository headCommit.
	[ after := self repository commitWithMessage: 'Another commit message'.
	self assert: after notNil.
	self deny: before equals: after.
	^ self ]
		on: IceGitUsernameOrEmailNotFound
		do: [ :error | 
			(self repository getConfigurationGlobal: false) username: 'mock'.
			error resume ].
	self fail