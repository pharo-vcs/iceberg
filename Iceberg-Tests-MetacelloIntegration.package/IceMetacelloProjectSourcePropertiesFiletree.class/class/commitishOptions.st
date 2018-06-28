testing
commitishOptions

	^	super commitishOptions , {	
			':30c9f38109f437d184b4017e7d9da9d953266e8b'. "With commit" 
			"Adding the src directory"
			'/src'. "Without commitish"
			':forBecomeWriteable/src'. "With branch"
			':1.2.3/src'. "with tag"
			':30c9f38109f437d184b4017e7d9da9d953266e8b/src'. "With commit" }



