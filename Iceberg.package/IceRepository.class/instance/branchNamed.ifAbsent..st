branches
branchNamed: aName ifAbsent: absentBlock
	
	self
		branchNamed: aName
		ifPresent: [ :branch | ^ branch ]
		ifAbsent: absentBlock