executing
applyOn: aRepository
	self validateItems.
	self validateMessage.
	aRepository
		commitCherryPick: self items 
		withMessage: self message.
	self isPublish 
		ifTrue: [ aRepository push ]