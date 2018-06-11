private
toggleSelectionOf: item
	(self isSelected: item)
		ifTrue: [ self remove: item ]
		ifFalse: [ self add: item ].
	self tableRefresh