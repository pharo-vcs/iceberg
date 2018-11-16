enumerating
allChildrenDo: aBlockClosure 
	
	self childrenDo: [ :e |
		aBlockClosure value: e.
		e allChildrenDo: aBlockClosure ]