tests
testCommitIsLoaded
	| loadedVersion loadedVersionNumber loadedCommit |

	"1. Prepare"
	"1.1 - Load the next-to-last version"
	self gitCommand: 'checkout -b outdatedMaster master^1'.
	loadedVersion := (repository packageNamed: packageName) latestVersion load.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commitId equals: self currentCommitId.
	
	"1.2 - Go back to HEAD"
	repository checkoutBranch: 'master'.
	
	"1.3 - Some verifications before excersising"
	self assert: repository incommingCommits size equals: 1.
	self assert: (self currentCommitMessage endsWith: (loadedVersionNumber + 1) asString).
	self deny: loadedVersion commitId = self currentCommitId.
	self assert: (repository latestVersion: packageName) commitId equals: self currentCommitId.
	
	"2. Excercise"
	repository updatePackage: packageName.
	
	"3. Verify"
	"3.1 - There shouldn't be more incomming commits"
	self assert: repository incommingCommits size equals: 0.

	"3.2 - The newly loaded commit should correspond to the loaded version / working copy"
	loadedVersion := (repository packageNamed: packageName) latestVersion load.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commitId equals: self currentCommitId.
