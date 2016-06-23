tests
testCommitIsLoaded
	| latestVersionNumber loadedCommit loadedVersionDescriptor versionInfoFromWorkingCopy |

	"A. Outdated package status"
	"A1.1 - Preparation: load the next-to-last version"
	repository command: 'checkout master^1'.
	repository loadPackage: packageName.
	latestVersionNumber := (repository latestVersion: packageName) versionNumber.
	self checkVersionNumber: latestVersionNumber.
	
	"A1.2 - Go back to HEAD"
	repository command: 'checkout master'; refresh.
	
	"A3.1 - Assert there is a new incomming commit"
	self assert: repository incommingCommits size equals: 1.
	self assert: (repository latestVersion: packageName) versionNumber equals: latestVersionNumber + 1.
	
	"A3.2 - The all-but-last commit corresponds to the loaded version / working copy"
	loadedCommit := repository allCommits second.
	loadedVersionDescriptor  := repository allVersionDescriptors detect: [ :entry | entry commitID hex = loadedCommit commitId ].
	versionInfoFromWorkingCopy := (Iceberg packageNamed: packageName) workingCopy versionInfo.
	self assert: versionInfoFromWorkingCopy id equals: loadedVersionDescriptor info id.
	
	"B. Second part: Update the package."
	"B1 - Preparation"
	repository updatePackage: packageName.
	
	"B3.1 - Assert there are no more incomming commits"
	self assert: repository incommingCommits size equals: 0.
	self checkVersionNumber: latestVersionNumber + 1.

	"B3.2 - Assert that the newly loaded commit correspond to the loaded version / working copy"
	loadedCommit := repository allCommits first.
	loadedVersionDescriptor  := repository allVersionDescriptors detect: [ :entry | entry commitID hex = loadedCommit commitId ].
	versionInfoFromWorkingCopy := (Iceberg packageNamed: packageName) workingCopy versionInfo.
	self assert: versionInfoFromWorkingCopy id equals: loadedVersionDescriptor info id.
