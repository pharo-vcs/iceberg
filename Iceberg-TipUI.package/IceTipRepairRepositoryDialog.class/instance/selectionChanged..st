private
selectionChanged: ann
	selectedOption := ann newSelectedRowIndexes 
		ifNotEmpty: [ :indexes |(self optionsList widget dataSource elementAt: indexes first) ]
		ifEmpty: [ nil ].
	self refreshDetailPanel