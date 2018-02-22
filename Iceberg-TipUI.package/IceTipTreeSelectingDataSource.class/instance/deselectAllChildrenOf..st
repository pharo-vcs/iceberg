private
deselectAllChildrenOf: item
	(self withAllChildrenOf: item) 
		do: [ :each | selectedItems remove: each data ifAbsent: [] ].
	self tableRefresh