tests - loading
testLoadCommit
	| commit commitToBeLoaded | 
	"1. - Preparation: have an incomming commit which does not have versions for all loaded packages"
	"1.1 - Commit a new version of some package"
	repository loadPackage: packageName.
	self saveNewVersion.

	"1.2 - Remove the modified package"
	self removeTestPackages.

	"1.3 - Checkout and load the previous version"
	repository checkoutBranch: 'master^1'.
	repository loadPackage: packageName.
	repository loadPackage: otherPackageName.
	
	"1.4 - Checkout (but not load) the latest version"
	repository checkoutBranch: 'master'.

	"1.5 - Verify that there is an incomming commit"
	self assert: repository incommingCommits size equals: 1.

	commit := repository incommingCommits last.
	repository loadedPackages do: [ :package | 
		self assert: (commit properVersionFor: package ) notNil
	].

	"1.6 - Verify that there is an incomming commit"
	commitToBeLoaded := repository incommingCommits first.	 
	self deny: repository loadedCode = repository headCommit.
	
	"2. Exercise: Update the package from remote repository"
	commitToBeLoaded load. 
	
	"3. Assert the commit is now loaded."	
	self assert: repository loadedCode equals: repository headCommit.