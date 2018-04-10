private factory
refreshWhenRepository: ann
	(self model isModelOf: ann repository)
		ifFalse: [ ^ self ].
	self model reset.   
	self refresh.