tests
testBecomeWriteable
	"Prepare"
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	Metacello new
	  baseline: 'PharoGitTest';
	  repository: 'github://npasserini/pharo-git-test';
	  load.

	"Exercise"
	self package iceRepository ensureLocalRepository.
	
	"Test"
	self assert: self defaultLocation exists.
	self assert: (self defaultLocation / '.git') exists.
	