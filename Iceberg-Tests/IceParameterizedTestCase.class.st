"
I am a test case that is run several times with different configuration. Each configuration is defined by a set of IceParameterValué's. Possible values are defined in IceParameter objects, which in turn are provided by my #parameters class method, which should be overriden by my subclasses.

If #parameters method is not overriden, I will be run as a normal test case.

To run with the parameterization you have to use Test Runner. If you run tests from Nautilus, they will ignore parameterization and run with current global configuration. For example if you ran IceBranchTest from the test runner it will be run with every Iceberg backend loaded in the image (see #parameters class method in IceBranchTest). But if you run it from Nautilus it will run the test only once with the current backend, as specified by IceRepository class>>defaultBackendType.
"
Class {
	#name : #IceParameterizedTestCase,
	#superclass : #TestCase,
	#instVars : [
		'testParameters',
		'oldShareRepositoriesBetweenImages',
		'provider'
	],
	#category : #'Iceberg-Tests-Base'
}

{ #category : #'building suites' }
IceParameterizedTestCase class >> buildSuite [
	^ self buildSuiteNamed: self name asString 
		withGlobals: #() 
		andSubsuites: self parameters

]

{ #category : #'building suites' }
IceParameterizedTestCase class >> buildSuiteNamed: suiteName withGlobals: globals andConfigurations: configs [
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


]

{ #category : #'building suites' }
IceParameterizedTestCase class >> buildSuiteNamed: suiteName withGlobals: globalParameterValues andSubsuites: moreParameters [
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


]

{ #category : #history }
IceParameterizedTestCase class >> lastStoredRun [
	^ ((Dictionary new) add: (#timeStamp->(DateAndTime basicNew instVarAt: 1 put: 72896; instVarAt: 2 put: (Duration seconds: 3600 nanoSeconds: 0); instVarAt: 3 put: 2457731; instVarAt: 4 put: 823745000; yourself)); add: (#passed->((Set new) add: #testParameters; yourself)); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)
]

{ #category : #'building suites' }
IceParameterizedTestCase class >> parameters [
	"No parameters will make this tests work like a normal TestCase"
	^ #()
]

{ #category : #configurations }
IceParameterizedTestCase class >> remoteTypeConfiguration [
	^ IceTestParameter 
		withOptions: { #httpsUrl. #scpUrl }
		on: Iceberg 
		selector: #remoteTypeSelector
]

{ #category : #configurations }
IceParameterizedTestCase class >> repositoryBackendConfiguration [
	^ IceTestParameter withOptions: {1}
]

{ #category : #private }
IceParameterizedTestCase >> cleanUpInstanceVariables [
	| instanceVariablesNames |
	instanceVariablesNames := #('testSelector' 'testParameters').
	self class allInstVarNames
		do: [ :name | 
			(instanceVariablesNames includes: name)
				ifFalse: [ self instVarNamed: name put: nil ] ]
]

{ #category : #running }
IceParameterizedTestCase >> isCI [
	^ (OSEnvironment current at: 'CI' ifAbsent: [ 'false' ]) asLowercase = 'true'
]

{ #category : #accessing }
IceParameterizedTestCase >> parameters [
	^ testParameters ifNil: [ testParameters := #() ]
]

{ #category : #accessing }
IceParameterizedTestCase >> parameters: anObject [
	testParameters := anObject
]

{ #category : #printing }
IceParameterizedTestCase >> printOn: aStream [
	super printOn: aStream.

	self parameters ifNotEmpty: [
		aStream nextPut: $(.
		aStream nextPutAll: (', ' join: (self parameters collect: #shortName)).
		aStream nextPut: $)
	]

]

{ #category : #running }
IceParameterizedTestCase >> setUp [
	super setUp.
	oldShareRepositoriesBetweenImages := IceLibgitRepository shareRepositoriesBetweenImages.
	IceLibgitRepository shareRepositoriesBetweenImages: false.
	provider := IceCredentialsProvider providerType.
	IceCredentialsProvider providerType: IceNonInteractiveCredentialsProvider.
	self parameters do: #activate.
]

{ #category : #running }
IceParameterizedTestCase >> tearDown [
	self parameters
		do: [ :parameter | 
			[ parameter deactivate ]
				on: Error
				do: [ :error | error traceCr ] ].
	IceLibgitRepository shareRepositoriesBetweenImages: oldShareRepositoriesBetweenImages.
	IceCredentialsProvider providerType: provider.
	super tearDown
]
