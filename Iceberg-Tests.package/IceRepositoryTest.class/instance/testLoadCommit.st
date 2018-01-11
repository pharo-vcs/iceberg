tests - loading
testLoadCommit
	| incomingCommit changedPackage unchangedPackage | 
	self scenarioTwoLoadedPackagesOneOutdated.


	"1.1 - Verify incoming commits and versions"
	self assert: repository incomingCommits size equals: 1.

	incomingCommit := repository incomingCommits first.
	changedPackage := repository packageNamed: packageName.
	unchangedPackage := repository packageNamed: otherPackageName.

	self deny: incomingCommit equals: changedPackage currentCommit.
	self deny: incomingCommit equals: unchangedPackage currentCommit.
	
	self assert: incomingCommit parent equals: changedPackage currentCommit.
	self assert: incomingCommit parent equals: unchangedPackage currentCommit.
	
	"2. Exercise: Update the package from remote repository"
	repository head checkout.
	
	"3. Assert the commit is now loaded."	
	self assert: repository incomingCommits isEmpty.

	self assert: incomingCommit equals: changedPackage currentCommit.
	self assert: incomingCommit equals: unchangedPackage currentCommit.