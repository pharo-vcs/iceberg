branches
branchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock 
	
	| found |

	self withRepoDo: [ :repo |
		found := repo lookupLocalBranch: aString ifAbsent: [ nil ]
	].

	^ found
			ifNil: absentBlock
			ifNotNil: [ presentBlock value: (self basicNewBranchNamed: aString) ]