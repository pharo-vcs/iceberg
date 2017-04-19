auxiliar
createIncomingCommit
	"Create a new version of a package in the remote repository.
	Return the version number in the created commit, so it can be verified after loading it."

	| versionNumber | 
	
	"1 - First load a package"
	repository loadPackage: packageName.
	versionNumber := (Smalltalk at: #Test) new versionNumber.

	"2 - Modify it and commit to a new branch"
	self updateVersionNumber: versionNumber + 1.
	repository commitPackagesWithMessage: ('Updated test method with version {1}' format: { versionNumber + 1}).

	versionNumber := (Smalltalk at: #Test) new versionNumber.

	"3 - Push the branch to origin/master"
	repository push.

	"4 - Remove last commit from local repo"
	self gitCommand: 'reset --hard HEAD^'.
	
	"5 - Reload the package from local repository"
	self removeTestPackages.
	self deny: (Smalltalk globals includesKey: #Test).	
	repository loadPackage: packageName.
	self checkLoadedLatestCommitWithVersion: versionNumber - 1.

	^ versionNumber
