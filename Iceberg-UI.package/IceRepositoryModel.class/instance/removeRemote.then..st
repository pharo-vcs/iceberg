actions remotes
removeRemote: aRemoteModel then: aBlock
	(self confirm: (('You are going to remove remote {1}. 
Are you sure?') format: {aRemoteModel remote}))
		ifFalse: [ ^ self ].
	self repository removeRemote: aRemoteModel remote.
	aBlock cull: aRemoteModel remote