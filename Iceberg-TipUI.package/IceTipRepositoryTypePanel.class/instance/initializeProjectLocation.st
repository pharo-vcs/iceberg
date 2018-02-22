initialization
initializeProjectLocation
	projectLocation := self instantiate: IceDirectoryModel.
	projectLocation 
		label: 'Local directory';
		chooseTitle: 'Choose local repository';
		location: self defaultLocation	