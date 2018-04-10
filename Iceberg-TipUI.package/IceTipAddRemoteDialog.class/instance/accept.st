actions
accept
	^ self withAssertHandlingDo: [ 
		self validate.
		self model 
			addRemoteNamed: self remoteName 
			url: self remoteUrl ]