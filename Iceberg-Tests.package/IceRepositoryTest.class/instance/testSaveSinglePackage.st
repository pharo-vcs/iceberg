tests
testSaveSinglePackage
	| latestVersionNumber | 
	repository loadPackage: packageName.
	latestVersionNumber := (repository latestVersion: packageName) versionNumber.

	self saveNewVersion.
	
	self assert: ((repository latestVersion: packageName) versionNumber) 
		equals: latestVersionNumber + 1
