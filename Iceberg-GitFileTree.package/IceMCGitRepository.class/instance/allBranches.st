querying
allBranches
	^  (self command: 'branch -a') lines collect: [ :line | 
			| refName |
			refName := line allButFirst: 2.
			(refName beginsWith: 'remotes/')
				ifTrue: [ IceRemoteBranch named: (refName withoutPrefix: 'remotes/') inRepository: self frontend ]
				ifFalse: [ IceLocalBranch named: refName inRepository: self frontend ]
		]