initialization
initializeProjectLocation
	projectLocation := self instantiate: IceTipDirectoryPresenter.
	projectLocation 
		label: 'Local directory';
		chooseTitle: 'Choose local repository';
		location: self defaultLocation	