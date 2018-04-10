event handling
selectionChanged: ann
	| element |
	ann newSelectedRowIndexes
		ifNotEmpty: [ :indexes | 
			element := changeList widget dataSource realElementAt: indexes first.
			self 
				diffContentsLeft:  element value rightContents
				right: element value leftContents ] 
		ifEmpty: [ 
			self resetDiffContents ].
	
	