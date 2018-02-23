tests
"tests"
testRemoveTag
	| package tag packageChangeSet |
	
	"Prepare"
	repository checkoutPackageNamed: packageName.
	package := RPackageOrganizer default packageNamed: packageName.
	tag := package addClassTag: 'NewTag'.
	Object subclass: #ForTestRemoveTag  instanceVariableNames: '' classVariableNames: '' category: tag categoryName.
	repository commitWithMessage: 'for #testRemoveTag'.
	
	package removeClassTag: 'NewTag'.
	repository register.
	
	"Asserts"
	packageChangeSet := repository workingCopyDiff elements 
		detect: [ :changeSet | changeSet description = 'Pharo-Git-Test' ].
	self assert: (packageChangeSet organizationChange oldOrganization includes: 'Pharo-Git-Test-NewTag').
	self assert: (packageChangeSet organizationChange newOrganization includes: 'Pharo-Git-Test-NewTag') not.
