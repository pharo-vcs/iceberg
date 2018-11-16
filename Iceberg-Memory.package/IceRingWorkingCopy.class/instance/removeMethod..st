private-impacting changes
removeMethod: anIceMethodDefinition 
	
	self
		removeMethod: anIceMethodDefinition selector
		fromClass: anIceMethodDefinition ownerName