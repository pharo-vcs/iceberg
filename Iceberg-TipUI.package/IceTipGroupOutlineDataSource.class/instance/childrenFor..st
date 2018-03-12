private
childrenFor: aModel
	self flag: #todo. "Maybe do something better than this?"
	^ (aModel respondsTo: #elements)
		ifTrue: [ aModel elements ]
		ifFalse: [ #() ] 