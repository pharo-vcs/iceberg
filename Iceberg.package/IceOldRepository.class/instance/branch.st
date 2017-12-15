accessing
branch
	self isValid ifFalse: [ ^ IceUnknownBranch new ].
	^ self backend branch