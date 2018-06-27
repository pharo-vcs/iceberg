testing
commitishOptions

	^	super commitishOptions , {	
			':92f28a10326eaa36893e06468687a1e59bd6fb62'. "With commit" 
			"Adding the src directory"
			'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':92f28a10326eaa36893e06468687a1e59bd6fb62/src'. "With commit" }



