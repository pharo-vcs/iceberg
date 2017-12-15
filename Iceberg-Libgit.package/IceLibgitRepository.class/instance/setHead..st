private-head
setHead: anIceGitCommitish

	self withRepoDo: [ :repo |
		repo checkout: anIceGitCommitish gitRef ]