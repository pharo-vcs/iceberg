private
iconFor: aModel
	self flag: #todo. "Maybe do something better than this?"
	^ (aModel respondsTo: #icon)
		ifTrue: [ aModel icon ]
		ifFalse: [ nil ]