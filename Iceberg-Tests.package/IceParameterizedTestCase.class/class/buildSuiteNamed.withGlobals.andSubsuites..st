building suites
buildSuiteNamed: suiteName withGlobals: globalParameterValues andSubsuites: moreParameters
	| suite |
	moreParameters ifEmpty: [ 
		suite := self buildSuiteFromSelectors. 
		suite tests do: [ :test | test parameters: globalParameterValues ]
	]
	ifNotEmpty: [ 
		| config |
		suite := self suiteClass named: suiteName.
		config := moreParameters first.
		config options do: [ :global |
			suite addTest: (self
				buildSuiteNamed: global value printString
				withGlobals: (globalParameterValues copyWith: global)
				andSubsuites: moreParameters copyWithoutFirst)
		]
	].

	^ suite

