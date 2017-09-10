parsing
methodDef
	^ self newMethodDefinitionFrom: { 
		self separator.
		self try: [ self metadata ]. 
		self separator. 
		self method. 
		self methodBody 
	}