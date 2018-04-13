initialization
newRemoteNamed: aName toRepository: aRepository

	^ IceGitRemote name: aName url: aRepository location resolve asUrl asString