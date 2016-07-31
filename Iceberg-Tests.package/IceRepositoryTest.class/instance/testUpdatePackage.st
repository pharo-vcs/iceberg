tests
testUpdatePackage
	| originalVersionNumber | 
	"1. - Preparation: create a new version of a package in the remote repository"
	"1.1 - First load a package"
	repository loadPackage: packageName.
	originalVersionNumber := (Smalltalk at: #Test) new versionNumber.

	"1.2 - Modify it and commit to a new branch"
	self updateVersionNumber: originalVersionNumber + 1.
	repository savePackage: packageName 
		withMessage: ('Updated test method with version {1}' format: { originalVersionNumber + 1}).

	originalVersionNumber := (Smalltalk at: #Test) new versionNumber.

	"1.3 - Push the branch to origin/master"
	repository push.

	"1.4 - Remove last commit from local repo"
	self gitCommand: 'reset --hard HEAD^'.
	
	"1.5 - Reload the package from local repository"
	self removeTestPackages.
	self deny: (Smalltalk globals includesKey: #Test).	
	repository loadPackage: packageName.
	self checkLoadedLatestCommitWithVersion: originalVersionNumber - 1.

	"2. Exercise: Update the package from remote repository"
	repository updatePackage: packageName.
	
	"3. Verify"
	self checkLoadedLatestCommitWithVersion: originalVersionNumber.
