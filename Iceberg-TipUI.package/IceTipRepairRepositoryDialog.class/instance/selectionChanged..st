private
selectionChanged: ann
	selectedOption := ann newSelectedIndexes
		ifNotEmpty:
			[ :indexes | self optionsList widget dataSource elementAt: indexes first ]
		ifEmpty: [ nil ].
	self refreshDetailPanel