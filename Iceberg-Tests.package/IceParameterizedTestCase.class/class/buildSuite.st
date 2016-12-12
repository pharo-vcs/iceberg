building suites
buildSuite
	^ self buildSuiteNamed: self name asString 
		withGlobals: #() 
		andSubsuites: self parameters
