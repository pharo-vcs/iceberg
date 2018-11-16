private accessing
remoteToUse
	self remote ifNotNil: [ ^ self remote ].
	self url ifNotNil: [ ^ IceGitRemote url: self url ]. 
	^ nil