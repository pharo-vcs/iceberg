tests - create repository
testBecomeWriteable
	"Prepare"
	| writableRepository |
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	self disablingMetacelloIntegrationDo: [
		Metacello new
		  	baseline: 'PharoGitTest';
		  	repository: 'github://pharo-vcs/pharo-git-test:forBecomeWriteable';
			onConflict: [ :e | e useIncoming ];
			load ].

	"Exercise"
	writableRepository := self package iceRepository.
	[
		"Test"
		self assert: self defaultLocationForGithubClonedRepository exists.
		self assert: (self defaultLocationForGithubClonedRepository / '.git') exists.
		
		self assert: writableRepository currentBranch name equals: 'forBecomeWriteable'.
		self assert: writableRepository backend currentBranch equals: 'forBecomeWriteable'.
		
		writableRepository pull.
		self assert: ((Smalltalk at: #Test) canUnderstand: #forBecomeWritable)
	]
	ensure: [ writableRepository forget ]