API-changes
changesTo: aCommitish

	| removedPackages changes |
	changes := Set new.
	
	changes addAll: (aCommitish changesFromCommit: self referenceCommit).
	removedPackages := aCommitish packages \ self packages.
	changes addAll: (((self modifiedPackages, removedPackages) collect: [ :each | 
			IceImageChange package: each ])).
		
	self project = aCommitish project
		ifFalse: [ changes add: IceProjectChange new ].
	^ changes