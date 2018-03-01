event handling
selectionChanged: ann
	| element |
	ann newSelectedRowIndexes
		ifNotEmpty: [ :indexes | 
			element := changeList widget dataSource realElementAt: indexes first.
			self 
				diffContentsLeft:  element value leftContents
				right: element value rightContents ] 
		ifEmpty: [ 
			self resetDiffContents ].
	
	