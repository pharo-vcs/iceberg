API-changes
changesTo: aCommitish

	| removedPackages changes |
	changes := Set new.
	
	changes addAll: (aCommitish changesFromCommit: self referenceCommit).
	removedPackages := aCommitish packages \ self packages.
	changes addAll: (((self modifiedPackages, removedPackages) collect: [ :each | 
			IceImageChange package: each ])).
		
	self project isDirty
		ifTrue: [ changes add: IceProjectChange new ].
	self repositoryProperties isDirty
		ifTrue: [ changes add: IceCypressPropertiesChange new ].
	^ changes