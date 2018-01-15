accessing remotes
doRemoveRemote: aRemote

	self withRepoDo: [ :repo |
		(LGitRemote of: repo named: aRemote name)
			lookup;
			delete ]