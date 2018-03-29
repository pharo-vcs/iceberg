tests
testAddTag
	| package packageChangeSet |
	
	"Prepare"
	repository loadPackageNamed: packageName.
	package := RPackageOrganizer default packageNamed: packageName.
	package addClassTag: 'NewTag'.
	
	"Asserts"
	packageChangeSet := repository workingCopyDiff elements 
		detect: [ :changeSet | changeSet description = 'Pharo-Git-Test' ].
	self assert: (packageChangeSet organizationChange oldOrganization includes: 'Pharo-Git-Test-NewTag') not.
	self assert: (packageChangeSet organizationChange newOrganization includes: 'Pharo-Git-Test-NewTag').
