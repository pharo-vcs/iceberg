tests
testAddTag
	| package packageChangeSet |
	
	"Prepare"
	repository checkoutPackageNamed: packageName.
	package := RPackageOrganizer default packageNamed: packageName.
	package addClassTag: 'NewTag'.
	
	"Asserts"
	packageChangeSet := (IceRootNode forRepository: repository) elements 
		detect: [ :changeSet | changeSet description = 'Pharo-Git-Test' ].
	self assert: (packageChangeSet organizationChange oldOrganization includes: 'Pharo-Git-Test-NewTag') not.
	self assert: (packageChangeSet organizationChange newOrganization includes: 'Pharo-Git-Test-NewTag').
