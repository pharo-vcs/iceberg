tests
testRemoveTag
	| package packageChangeSet |
	
	"Prepare"
	repository loadPackage: packageName.
	package := RPackageOrganizer default packageNamed: packageName.
	package addClassTag: 'NewTag'.
	repository savePackage: packageName withMessage: 'for #testRemoveTag'.
	
	package removeClassTag: 'NewTag'.
	
	"Asserts"
	packageChangeSet := (IceDiff forRepository: repository) elements 
		detect: [ :changeSet | changeSet description = 'Pharo-Git-Test' ].
	self assert: (packageChangeSet organizationChange oldOrganization includes: 'Pharo-Git-Test-NewTag').
	self assert: (packageChangeSet organizationChange newOrganization includes: 'Pharo-Git-Test-NewTag') not.
