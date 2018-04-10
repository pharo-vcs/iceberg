private
toggleSelectionOf: item
	(self isSelected: item) 
		ifTrue: [ selectedItems remove: item ]
		ifFalse: [ selectedItems add: item ].
	self tableRefresh