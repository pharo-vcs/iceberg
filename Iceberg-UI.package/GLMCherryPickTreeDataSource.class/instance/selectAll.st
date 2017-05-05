updating
selectAll
	self rootsItems do: [ :each | 
		self selectAllChildrenOf: each ]