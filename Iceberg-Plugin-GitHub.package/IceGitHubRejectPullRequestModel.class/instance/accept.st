actions
accept
	acceptBlock ifNotNil: [ 
		acceptBlock cull: self ].
	
	self window delete