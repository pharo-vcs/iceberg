tests - loading
testLoadCommit
	| commit changedPackage unchangedPackage | 
	self scenarioTwoLoadedPackagesOneOutdated.

	"1.1 - Verify incomming commits and versions"
	self assert: repository incommingCommits size equals: 1.

	commit := repository incommingCommits first.
	changedPackage := repository packageNamed: packageName.
	unchangedPackage := repository packageNamed: otherPackageName.

	self assert: changedPackage incommingVersions size equals: 1.
	self assert: unchangedPackage incommingVersions isEmpty.
	self deny: (commit properVersionFor: changedPackage) = changedPackage loadedVersion.
	self assert: (commit properVersionFor: changedPackage) parent equals: changedPackage loadedVersion.
	self assert: (commit properVersionFor: unchangedPackage) equals: unchangedPackage loadedVersion.
	
	"1.2 - Check the commit and its versions"
	self assert: (commit ownVersionFor: changedPackage) equals: (commit properVersionFor: changedPackage).
	self assert: (commit ownVersionFor: unchangedPackage) ~= (commit properVersionFor: unchangedPackage).

	"2. Exercise: Update the package from remote repository"
	commit load. 
	
	"3. Assert the commit is now loaded."	
	self assert: changedPackage incommingVersions isEmpty.
	self assert: unchangedPackage incommingVersions isEmpty.

	self assert: (commit properVersionFor: changedPackage) equals: changedPackage loadedVersion.
	self assert: (commit properVersionFor: unchangedPackage) equals: unchangedPackage loadedVersion.
	
	self assert: repository incommingCommits isEmpty.