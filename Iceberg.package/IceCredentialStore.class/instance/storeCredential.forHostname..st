API -  accessing
storeCredential: credential forHostname: aHostname
 
	self loadFromStore.
	credential storeInto: self forHostname: aHostname.
	self saveIntoStore