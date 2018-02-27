accessing
selectAll
	self rootItem children
		do: [ :each | self selectAllChildrenOf: each ].
	self tableRefresh