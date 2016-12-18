actions
pushThen: aBlock
	self flag: #todo. "Replace #origin with #remoteToPush"
	self 
		pushTo: self repository origin 
		then: aBlock