tests
testPackageStatus
	| packageModel |
	packageModel := (IcePackageModel modelFor: (repository packageNamed: packageName)).
	self assert: packageModel status equals: 'Not loaded'
