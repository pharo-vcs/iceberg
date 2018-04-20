actions
addRemote
	(IceTipAddRemoteDialog on: self model repositoryModel) 
		onAccept: [ :newRemoteName | 
			self model reset.
			self refresh.
			self selectRemoteNamed: newRemoteName ];
		openDialogWithSpec.