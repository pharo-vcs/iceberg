tests
testCommitWithEmptyUserMailThrowsException

	(self repository getConfigurationGlobal: false)
		email: ''.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound