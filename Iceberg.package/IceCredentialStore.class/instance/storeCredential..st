API -  accessing
storeCredential: credential
 
	self loadFromStore.
	credential storeInto: self forHostname: credential host.
	self saveIntoStore