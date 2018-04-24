initialization
initializeWidgets
	projectLocation := self instantiate: IceTipDirectoryPresenter.
	projectLocation 
		label: 'Local directory';
		chooseTitle: 'Choose local repository';
		location: self repository location.
		
	subdirectoryLabel := self newLabel label: 'Source directory'.
	subdirectoryInputText := self newTextInput 
		ghostText: 'e.g., src';		
		autoAccept: true.
	subdirectoryInputText text: self repository subdirectory.
		
	self focusOrder 
		add: self projectLocation;
		add: self subdirectoryInputText