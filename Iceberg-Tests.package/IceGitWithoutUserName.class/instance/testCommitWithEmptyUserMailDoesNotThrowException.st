tests
testCommitWithEmptyUserMailDoesNotThrowException

	(self repository getConfigurationGlobal: false)
		email: ''.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		shouldnt: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound