API - storing
removeCredential: aCredential 

	aCredential removeFrom: self.
	self saveIntoStore.