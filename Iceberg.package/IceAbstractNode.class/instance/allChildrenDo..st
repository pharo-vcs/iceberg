enumerating
allChildrenDo: aBlockClosure 
	
	self children do: [ :e |
		aBlockClosure value: e.
		e allChildrenDo: aBlockClosure ]