tests
testAddTag
	| package packageChangeSet |
	
	"Prepare"
	repository loadPackage: packageName.
	package := RPackageOrganizer default packageNamed: packageName.
	package addClassTag: 'NewTag'.
	
	"Asserts"
	packageChangeSet := (IceWorkingCopyDiff forRepository: repository) elements 
		detect: [ :changeSet | changeSet description = 'Pharo-Git-Test' ].
	self assert: (packageChangeSet oldOrganization includes: 'Pharo-Git-Test-NewTag') not.
	self assert: (packageChangeSet newOrganization includes: 'Pharo-Git-Test-NewTag').
