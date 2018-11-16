private
refreshWhenRepository: ann
	(self model repositoryModel isModelOf: ann repository)
		ifFalse: [ ^ self ].
	self model reset.
	self refresh