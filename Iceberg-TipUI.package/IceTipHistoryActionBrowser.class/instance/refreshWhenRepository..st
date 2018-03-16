private
refreshWhenRepository: ann
	(self model entity = ann repository)
		ifFalse: [ ^ self ].
	self model reset.
	self refresh