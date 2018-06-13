initialization
initializeWidgets
	nameLabel := self newLabel label: 'Project Name'.
	nameInput := self newLabel label: self model name.
	sourceDirectoryLabel := self newLabel label: 'Source directory'.
	sourceDirectoryTree := self newIceTreeTable.
	sourceDirectorySelectionLabel := self newLabel label: ''.
	
	self initializeDirectoryTree.
	self focusOrder
		add: nameInput