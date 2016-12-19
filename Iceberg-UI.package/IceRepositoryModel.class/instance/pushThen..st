actions
pushThen: aBlock
	self 
		pushTo: self repository workConfiguration pushingRemote 
		then: aBlock