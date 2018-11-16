private
toggleSelectionOf: item
	(self isSelected: item data) 
		ifTrue: [ self deselectAllChildrenOf: item ]
		ifFalse: [ self selectAllChildrenOf: item ].
	"self glamourPresentation cherryPick: selection."
	self tableRefresh
