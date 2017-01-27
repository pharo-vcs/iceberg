building suites
buildSuiteNamed: suiteName withGlobals: globals andConfigurations: configs
	| suite |
	configs ifEmpty: [ 
		suite := self buildSuiteFromSelectors. 
		suite tests do: [ :test | test testParameters: globals ]
	]
	ifNotEmpty: [ 
		| config |
		suite := self suiteClass named: suiteName.
		config := configs first.
		config options do: [ :global |
			suite addTest: (self
				buildSuiteNamed: global value printString
				withGlobals: (globals copyWith: global)
				andConfigurations: configs copyWithoutFirst)
		]
	].

	^ suite

