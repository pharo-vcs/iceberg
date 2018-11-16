actions
accept
	self validate.
	self model 
		addRemoteNamed: self remoteName 
		url: self remoteUrl.
	^ acceptBlock ifNotNil: [ acceptBlock cull: self remoteName ]