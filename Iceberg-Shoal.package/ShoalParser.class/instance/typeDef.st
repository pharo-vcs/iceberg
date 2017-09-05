parsing
typeDef
	^ { 
		self separator.
		self try: [ self comment ]. 
		self separator. 
		self type. 
		self separator. 
		self try: [ self metadata ] 
	}
		