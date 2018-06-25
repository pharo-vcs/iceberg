initialization
initializeWidgets
	nameLabel := self newLabel label: 'Project Name'.
	nameInput := self newLabel label: self model name.
	
	sourceDirectoryLabel := self newLabel label: 'Directory'.
	sourceDirectoryTree := self newIceTreeTable.
	
	formatLabel := self newLabel label: 'Format'.
	formatList := self newDropList.
	
	useSourceFolder := self newCheckBox 
		label: 'Use Source Directory';
		whenChangedDo: [ useSourceFolder state ifFalse: [ sourceDirectoryTree widget selectRowIndexes: #() ] ] .
	
	self initializeDirectoryTree.
	self focusOrder
		add: nameInput;
		add: sourceDirectoryTree;
		add: useSourceFolder;
		add: formatList