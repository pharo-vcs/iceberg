event handling
selectionChanged: ann
	| element |
	ann newSelectedRowIndexes ifEmpty: [ 
		self flag: #todo. "Do something? Some visual feedback of 'deselection'"
		^ self ].
	element := changeList widget dataSource realElementAt: ann newSelectedRowIndexes first.
	diffPanel 
		leftText: (element value leftContents ifNil: [ '' ]);
		rightText: (element value rightContents ifNil: [ '' ])