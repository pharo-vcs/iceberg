parsing
methodDef
	^ { 
	self separator.
	self try: [ self metadata ]. 
	self separator. 
	self method. 
	self separator. 
	self methodBody 
	}