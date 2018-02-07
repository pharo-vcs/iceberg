initialization
initializeWidgets
	projectNameLabel := self newLabel label: 'Project name'.
	projectNameInputText := self newTextInput 
		ghostText: 'MyProject';
		autoAccept: true.
	
	projectLocation := self instantiate: IceDirectoryModel.
	projectLocation 
		label: 'Local directory';
		chooseTitle: 'Choose local repository';
		location: self defaultLocation.
	projectNameInputText 	whenTextChanged: [ :text | 
		projectLocation appendPath: text ].
	
	subdirectoryLabel := self newLabel label: 'Sources directory'.
	subdirectoryInputText := self newTextInput 
		ghostText: 'src';		
		autoAccept: true.

	remoteLabel := self newLabel label: 'Remote'.
	remoteInputText := self newTextInput 
		ghostText: 'git@github.com:user/MyProject.git';	
		autoAccept: true.
	
	self focusOrder 
		add: projectNameInputText;
		add: projectLocation;
		add: subdirectoryInputText;
		add: remoteInputText.
	
	spacePanel := self newPanel "just to gain space"