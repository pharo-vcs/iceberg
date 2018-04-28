tests
testCommitWithoutUserMailThrowsException

	(self repository getConfigurationGlobal: false)
		unset: 'user.email'.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		should: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound