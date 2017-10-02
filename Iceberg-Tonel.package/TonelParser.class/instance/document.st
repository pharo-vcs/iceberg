parsing
document
	^ { 
	self typeDef.
	self methodDefList.
	 } 
	flattened
	select: #notNil