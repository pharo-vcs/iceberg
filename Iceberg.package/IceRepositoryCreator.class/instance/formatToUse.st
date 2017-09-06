accessing
formatToUse 
	self flag: #todo. "This should be better, not a hardcoded value :P"
	self useTonel ifTrue: [ ^ #tonel ].
	^ #cypress