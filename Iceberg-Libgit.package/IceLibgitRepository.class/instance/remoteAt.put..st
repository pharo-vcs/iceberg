API-remotes
remoteAt: aString put: aRemote

	self withRepoDo: [ :repo |
		repo
			addRemote: aRemote name
			url: aRemote url ]