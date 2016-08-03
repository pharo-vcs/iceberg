initialization
initializeWidgets
	localDirectoryLabel := self newLabel label: 'Local directory:'.
	localDirectory := self newLabel label: self initialLocalDirectory.
	changeLocationButton := self newButton label: 'Change'.
	
	subdirectoryLabel := self newLabel label: 'Code subdirectory:'.
	subdirectory := self newTextInput autoAccept: true.
	
	createButton := self newButton
		label: 'Create repository';
		yourself.
	
	self focusOrder 
		add: changeLocationButton;
		add: subdirectory;
		add: createButton