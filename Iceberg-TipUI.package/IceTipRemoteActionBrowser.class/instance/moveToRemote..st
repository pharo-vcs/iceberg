actions
moveToRemote: aRemoteModel
	self model useRemote: aRemoteModel.
	self model reset.
	self refresh