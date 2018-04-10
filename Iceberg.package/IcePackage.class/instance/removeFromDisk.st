actions
removeFromDisk
	self isLoaded ifTrue: [ 
		IceError signal: 'You can''t remove a loaded package.' ].
	self location ensureDeleteAll.
	self repository refresh.