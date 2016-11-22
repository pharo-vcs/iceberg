building suites
buildSuite
	^ self buildSuiteNamed: self name asString withGlobals: #() andConfigurations: self parameters
