accessing
selectAll
	selectedItems := Set new.
	self rootItem children
		do: [ :each | self selectAllChildrenOf: each ].
	self tableRefresh