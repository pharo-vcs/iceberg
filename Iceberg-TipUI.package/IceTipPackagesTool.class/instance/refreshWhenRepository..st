private
refreshWhenRepository: ann
	(ann repository isNil 
		or: [ self model entity = ann repository ])
		ifFalse: [ ^ self ].
	self refresh