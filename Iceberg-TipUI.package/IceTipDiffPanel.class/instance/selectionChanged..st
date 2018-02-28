event handling
selectionChanged: ann
	| element |
	ann newSelectedRowIndexes
		ifNotEmpty: [ :indexes | 
			element := changeList widget dataSource realElementAt: indexes first.
			diffPanel 
				leftText: element value leftContents;
				rightText: element value rightContents ] 
		ifEmpty: [ 
			diffPanel 
				leftText: '';
				rightText: '' ].
	
	