tests
testCommitWithoutUserMailDoesNotThrowsException

	(self repository getConfigurationGlobal: false)
		unset: 'user.mail'.
		
	self repository workingCopy addPackageNamed: 'AnotherPackage'.
	self
		shouldnt: [self repository commitWithMessage: 'Another commit message']
		raise: IceGitUsernameOrEmailNotFound