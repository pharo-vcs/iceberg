tests - versions
testVersions
	| package lastCommitIds | 
	package := repository packageNamed: packageName.
	
	"Use git directly to avoid that commit information is loaded by other means."
	lastCommitIds := (self gitCommand: { 'log'. '-3'. '--format=%H' }) trim lines.
	
	"Check commit ids from the latest two versions."
	(package versions first: 3) doWithIndex: [ :version :index | 
		self assert: version commit id equals: (lastCommitIds at: index).
		
	].

	"Ensure that versions do not use sequential numbers any more 
	(any number greater than 1e8 is for sure not assigned sequentially)."
	package versions do: [ :version |
		self assert: (version info name copyAfterLast: $.) asInteger > 1e8. 
	]

