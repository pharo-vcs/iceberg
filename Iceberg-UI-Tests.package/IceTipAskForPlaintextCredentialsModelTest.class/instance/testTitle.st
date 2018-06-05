tests
testTitle

	dialog remoteUrl: 'https://github.com/aaa/bbb'. 
	dialog openNonModal. 
	
	self assert: dialog title equals: 'Please log in to github.com'.