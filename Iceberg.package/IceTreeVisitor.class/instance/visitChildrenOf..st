visiting
visitChildrenOf: anIceNode 
	
	anIceNode childrenDo: [ :each | each accept: self ]