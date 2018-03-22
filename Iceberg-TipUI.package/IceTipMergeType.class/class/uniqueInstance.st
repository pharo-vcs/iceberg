instance creation
uniqueInstance 
	self = IceTipMergeType 
		ifTrue: [ self error: 'I''m an abstract type. Use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]