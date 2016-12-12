tests - create repository
testBecomeWriteable
	"Prepare"
	| writableRepository |
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	self disablingMetacelloIntegrationDo: [
		Metacello new
		  baseline: 'PharoGitTest';
		  repository: 'github://npasserini/pharo-git-test:forBecomeWriteable';
		  load
	].

	"Exercise"
	writableRepository := self package iceRepository.
	[
		writableRepository ensureLocalRepository.

		"Test"
		self assert: self defaultLocationForGithubClonedRepository exists.
		self assert: (self defaultLocationForGithubClonedRepository / '.git') exists.
		
		self assert: writableRepository currentBranch name equals: 'forBecomeWriteable'.
		self assert: writableRepository backend currentBranch equals: 'forBecomeWriteable'.
		
		writableRepository pull.
		self assert: ((Smalltalk at: #Test) canUnderstand: #forBecomeWritable)
	]
	ensure: [ writableRepository forget ]