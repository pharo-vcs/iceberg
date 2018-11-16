actions
moveToRemote: aRemoteModel
	aRemoteModel ifNil: [ ^ self ].
	
	self model useRemote: aRemoteModel.
	self model reset.
	self refreshCommits.
	self updateTitle