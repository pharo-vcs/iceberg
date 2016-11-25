tests
testPromoteTagAsPackage
	| package packageChangeSet class tag diff |
	
	"Prepare - Save some code within a tag"
	repository loadPackage: packageName.
	package := RPackageOrganizer default packageNamed: packageName.
	tag := package addClassTag: 'ToBePromoted'.

	class := Object 
		subclass: #ForTagPromotion 
		instanceVariableNames: '' 
		classVariableNames: '' 
		category: tag categoryName.
	class compile: 'whatever'.
	
	repository commitWithMessage: 'Preparing for #testPromoteTagAsPackage'.

	tag promoteAsRPackage.

	"Asserts"
	repository addPackageNamed: tag categoryName.
	repository register.
	self halt.
	
	diff := IceDiff forRepository: repository.
	self assert: (diff elements anySatisfy: [ :cs | cs description = packageName ]).
	self assert: (diff elements anySatisfy: [ :cs | cs description = tag categoryName ]).
"		detect: [ :changeSet | changeSet description = 'Pharo-Git-Test' ].
	self assert: (packageChangeSet organizationChange oldOrganization includes: 'Pharo-Git-Test-NewTag') not.
	self assert: (packageChangeSet organizationChange newOrganization includes: 'Pharo-Git-Test-NewTag').
"