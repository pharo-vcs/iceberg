private-remotes
doRemoveRemote: aRemote
	self handleLibgitError: [
		(LGitRemote of: self repositoryHandle named: aRemote name)
			lookup;
			delete ]