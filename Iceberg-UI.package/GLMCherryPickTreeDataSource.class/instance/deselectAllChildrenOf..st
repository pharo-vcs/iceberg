private
deselectAllChildrenOf: item
	(self withAllChildrenOf: item) 
		do: [ :each | selection remove: each data ifAbsent: [] ].
	self tableRefresh