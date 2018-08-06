initialization
initializeWidgets
	nameLabel := self newLabel label: 'Project Name'.
	nameInput := self newLabel label: self model name.
	
	sourceDirectoryLabel := self newLabel
		label: 'Code directory';
		yourself.
	sourceDirectoryTree := self newIceTreeTable.
	
	formatLabel := self newLabel label: 'Format'.
	formatList := self newDropList.

	self initializeDirectoryTree.
	self focusOrder
		add: nameInput;
		add: sourceDirectoryTree;
		add: formatList