private
obtainBranchName
	| baseName suffix count |
	
	count := 0. 	
	baseName := self class branchBaseName.
	suffix := ''.
	[ true ] whileTrue: [ 
		self repository 
			branchNamed: baseName, suffix
			ifAbsent: [ ^ baseName, suffix ].
		count := count + 1.
		suffix := '-', count asString ]