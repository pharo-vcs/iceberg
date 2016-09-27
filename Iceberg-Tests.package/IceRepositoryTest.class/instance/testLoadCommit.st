tests - loading
testLoadCommit
	| commit changedPackage unchangedPackage | 
	self scenarioTwoLoadedPackagesOneOutdated.

	"1.1 - Verify incomming commits and versions"
	self assert: repository incommingCommits size equals: 1.

	commit := repository incommingCommits first.
	changedPackage := repository packageNamed: packageName.
	unchangedPackage := repository packageNamed: otherPackageName.

	self assert: changedPackage incommingCommits size equals: 1.
	self assert: unchangedPackage incommingCommits isEmpty.
	self deny: (commit versionFor: changedPackage) = changedPackage loadedVersion.
	self assert: (commit versionFor: changedPackage) parent equals: changedPackage loadedVersion.
	self assert: (commit versionFor: unchangedPackage) equals: unchangedPackage loadedVersion.
	
	"2. Exercise: Update the package from remote repository"
	commit load. 
	
	"3. Assert the commit is now loaded."	
	self assert: changedPackage incommingCommits isEmpty.
	self assert: unchangedPackage incommingCommits isEmpty.

	self assert: (commit versionFor: changedPackage) equals: changedPackage loadedVersion.
	self assert: (commit versionFor: unchangedPackage) equals: unchangedPackage loadedVersion.
	
	self assert: repository incommingCommits isEmpty.