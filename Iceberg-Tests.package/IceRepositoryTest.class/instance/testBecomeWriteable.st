tests
testBecomeWriteable
	"Prepare"
	| writableRepository |
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	Metacello new
	  baseline: 'PharoGitTest';
	  repository: 'github://npasserini/pharo-git-test';
	  load.

	"Exercise"
	writableRepository := self package iceRepository.
	[
		writableRepository ensureLocalRepository.

		"Test"
		self assert: self defaultLocationForGithubClonedRepository exists.
		self assert: (self defaultLocationForGithubClonedRepository / '.git') exists.
	]
	ensure: [ writableRepository forget ]	