initialization
initializeObject: anObject
	realObject := anObject.
	cache := IceTipCache proxy: self.
	self initialize