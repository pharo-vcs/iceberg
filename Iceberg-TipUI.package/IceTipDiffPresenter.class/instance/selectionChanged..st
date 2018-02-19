event handling
selectionChanged: ann
	| element |
	element := changeList widget dataSource realElementAt: ann newSelectedRowIndexes first.
	diffPanel 
		leftText: element myVersion;
		rightText: element theirVersion