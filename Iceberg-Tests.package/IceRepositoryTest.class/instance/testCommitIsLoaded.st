tests
testCommitIsLoaded
	| loadedVersion loadedVersionNumber loadedCommit |

	self timeLimit: 2 minutes.
	
	"1. Prepare"
	"1.1 - Load the next-to-last version"
	repository head commit parent checkout.
	loadedVersion := (repository packageNamed: packageName) latestVersion.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commit id equals: self currentCommitId.
	
	"1.2 - Go back to HEAD"
	repository checkoutBranch: 'master'.
	
	"1.3 - Some verifications before excersising"
	loadedVersion := (repository packageNamed: packageName) latestVersion.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	
	self assert: repository incomingCommits size equals: 0.
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commit id equals: self currentCommitId.
	
	"2. Excercise"
	repository loadPackageNamed: packageName.
	
	"3. Verify"
	"3.1 - There shouldn't be more incoming commits"
	self assert: repository incomingCommits size equals: 0.

	"3.2 - The newly loaded commit should correspond to the loaded version / working copy"
	loadedVersion := (repository packageNamed: packageName) latestVersion.
	loadedVersionNumber := (Smalltalk at: #Test) new versionNumber.
	self assert: (self currentCommitMessage endsWith: loadedVersionNumber asString).
	self assert: loadedVersion commit id equals: self currentCommitId.
