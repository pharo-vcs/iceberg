API -  accessing
storeCredential: credential forHostname: aHostname
 
	credential storeInto: self forUrl: aHostname.
	self saveIntoStore