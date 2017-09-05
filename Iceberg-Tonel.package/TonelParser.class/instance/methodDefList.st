parsing
methodDefList
	| result |
	
	self separator. "to arrive to the end of the file in case there are no methods"
	result := Array new writeStream.
	[ stream atEnd ]
	whileFalse: [ 
		result nextPut: self methodDef.
		"skip possible spaces at the end"
		self separator ].
	
	^ result contents