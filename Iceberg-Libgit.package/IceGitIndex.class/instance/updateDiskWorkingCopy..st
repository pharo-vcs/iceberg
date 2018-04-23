updating
updateDiskWorkingCopy: anIceDiff
	anIceDiff tree
		accept:
			(IceGitWorkingCopyUpdateVisitor new
				repository: repository;
				index: self;
				diff: anIceDiff)