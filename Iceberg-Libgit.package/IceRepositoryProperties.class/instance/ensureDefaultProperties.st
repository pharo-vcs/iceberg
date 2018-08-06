initialization-release
ensureDefaultProperties
	
	properties at: #format ifAbsentPut: [ 
		self writerClass id
	]