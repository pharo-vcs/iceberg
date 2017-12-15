actions - utility
commitPackagesAndMarkAsMerged: aCommitish
	
	self halt.
	^ self 
		commitPackages: self modifiedPackages
		withMessage: 'Merging with ', aCommitish id
		andParents: { self headCommit . aCommitish }