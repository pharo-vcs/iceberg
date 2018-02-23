executing
applyOn: aRepository
	aRepository
		commitCherryPick: self items 
		withMessage: self message.
	self isPublish 
		ifTrue: [ aRepository push ]