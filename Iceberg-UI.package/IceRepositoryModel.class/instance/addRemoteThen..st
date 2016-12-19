actions
addRemoteThen: aBlock
	IceAddRepositoryModel new 
		setModal: true;
		repository: self repository;
		onAccept: aBlock;
		openWithSpec