tests
testCommitWithEmptyUserNameThrowsException

	(self repository getConfigurationGlobal: false)
		username: ''.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound