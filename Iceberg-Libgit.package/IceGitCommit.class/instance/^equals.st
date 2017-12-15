comparing
= aGitCommit

	(aGitCommit isKindOf: self species)
		ifFalse: [ ^ false ].
	^ self id = aGitCommit id