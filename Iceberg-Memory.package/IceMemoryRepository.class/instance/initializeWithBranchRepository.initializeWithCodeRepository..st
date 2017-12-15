private-initialize-release
initializeWithBranchRepository: aRepository initializeWithCodeRepository: anotherRepository

	branchRepository := aRepository.
	codeRepository := anotherRepository.
	self setHead: (IceUnbornBranch inRepository: self).