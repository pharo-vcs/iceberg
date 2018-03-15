initialization
selectionChanged: ann
	ann newSelectedRowIndexes
		ifNotEmpty: [ :indexes |	
			type := self typeList widget dataSource realElementAt: indexes first.
			self replacePanelWith: type.
			self title: type title ]
		ifEmpty: [ 
			self removeAllPanels.
			self title: self class title ]