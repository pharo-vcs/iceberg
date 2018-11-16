API-remotes
remoteAt: aString put: aRemote

	self handleLibgitError: [ self repositoryHandle addRemote: aRemote name url: aRemote url ]