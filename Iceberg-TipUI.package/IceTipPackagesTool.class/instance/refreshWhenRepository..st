private
refreshWhenRepository: ann
	(ann repository isNil 
		or: [ self model repositoryModel entity = ann repository ])
		ifFalse: [ ^ self ].
	self refresh