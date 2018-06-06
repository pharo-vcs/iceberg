tests
testTitle

	dialog remoteHostname: 'github.com'. 
	dialog openNonModal. 
	
	self assert: dialog title equals: 'Please log in to github.com'.