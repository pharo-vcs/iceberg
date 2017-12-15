accessing
newRemoteNamed: aName

	self ensureRemote.
	^ IceGitRemote name: aName url: remoteFileUrl asString