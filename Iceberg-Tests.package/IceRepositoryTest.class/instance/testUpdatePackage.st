tests
testUpdatePackage
	| latestVersionNumber | 
	"1. - Preparation: create a new version of a packa ge in the remote repository"
	"1.1 - First load a package"
	repository loadPackage: packageName.
	latestVersionNumber := (repository latestVersion: packageName) versionNumber.
	self checkVersionNumber: latestVersionNumber.

	"1.2 - Modify it and commit to a new branch"
	self updateVersionNumber: latestVersionNumber + 1.
	repository savePackage: packageName 
		withMessage: ('Updated test method with version {1}' format: (latestVersionNumber + 1) asString).
	self checkVersionNumber: latestVersionNumber + 1.
	
	"1.3 - Push the branch to origin/master"
	repository command: 'push'.

	"1.4 - Remove last commit from local repo"
	repository command: 'reset --hard HEAD^'.
	
	"1.5 - Reload the package from local repository"
	self removeTestPackage.
	self deny: (Smalltalk globals includesKey: #Test).	
	repository loadPackage: packageName.
	self checkVersionNumber: latestVersionNumber.

	"2. Exercise: Update the package from remote repository"
	repository updatePackage: packageName.
	
	"3. Verify"
	self checkVersionNumber: latestVersionNumber + 1.
