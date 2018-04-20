tests
testCommitWithoutUserNameThrowsException

	(self repository getConfigurationGlobal: false)
		unset: 'user.name'.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound