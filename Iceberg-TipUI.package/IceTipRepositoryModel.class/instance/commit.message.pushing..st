actions
commit: aCollectionOfChanges message: aString pushing: pushingBoolean
	self entity
		commitCherryPick: aCollectionOfChanges 
		withMessage: aString.
	pushingBoolean 
		ifTrue: [ self entity push ]