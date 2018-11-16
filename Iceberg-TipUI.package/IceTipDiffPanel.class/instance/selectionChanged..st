event handling
selectionChanged: ann
	| element |
	(ann newSelectedRowIndexes reject: [ :each | each = 0 ])
		ifNotEmpty: [ :indexes | 
			element := changeList widget dataSource realElementAt: indexes first.
			self 
				diffContentsLeft:  element value rightContents
				right: element value leftContents ] 
		ifEmpty: [ 
			self resetDiffContents ].
	
	