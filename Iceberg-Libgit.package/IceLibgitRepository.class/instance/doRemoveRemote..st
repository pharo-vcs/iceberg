accessing remotes
doRemoveRemote: aRemote
	(LGitRemote of: self repositoryHandle named: aRemote name)
		lookup;
		delete