tests
testPromoteTagAsPackage
	| package packageChangeSet class tag diff originalPackage newPackage |
	
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
	
	diff := IceDiff forRepository: repository.
	originalPackage := diff elements 
		detect: [ :cs | cs description = packageName ]
		ifNone: [ self fail ].
		
	newPackage := diff elements
		detect: [ :cs | cs description = tag categoryName ]
		ifNone: [ self fail ].
		
	self assert: originalPackage organizationChange removedCategories equals: #('Pharo-Git-Test-ToBePromoted').
	self assert: originalPackage changes size equals: 2.
	self assert: (originalPackage changes allSatisfy: [ :change | change isRemoval ]).
	self assert: (originalPackage changes anySatisfy: [ :change | 
		change definition isMethodDefinition and: [ change definition selector = #whatever]]).
	self assert: (originalPackage changes anySatisfy: [ :change | 
		change definition isClassDefinition and: [ change definition className = #ForTagPromotion]]).
		
	self assert: newPackage organizationChange newOrganization equals: #('Pharo-Git-Test-ToBePromoted').
	self assert: newPackage changes size equals: 2.
	self assert: (newPackage changes allSatisfy: [ :change | change isAddition ]).
	self assert: (newPackage changes anySatisfy: [ :change | 
		change definition isMethodDefinition and: [ change definition selector = #whatever]]).
	self assert: (newPackage changes anySatisfy: [ :change | 
		change definition isClassDefinition and: [ change definition className = #ForTagPromotion]]).
