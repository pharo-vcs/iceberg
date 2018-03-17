private
selectionChanged: ann
	self basicSelectionChanged: (ann newSelectedRowIndexes
		ifNotEmpty: [ :indexes |	self typeList widget dataSource realElementAt: indexes first ]
		ifEmpty: [ nil ])