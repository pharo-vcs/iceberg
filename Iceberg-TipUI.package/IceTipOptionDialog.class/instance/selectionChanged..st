private
selectionChanged: ann

	self basicSelectionChanged: (ann newSelectedIndexes
		ifNotEmpty: [ :indexes | self typeList widget dataSource realElementAt: indexes first ]
		ifEmpty: [ nil ])