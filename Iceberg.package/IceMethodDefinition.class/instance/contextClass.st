morphic-compatibility
contextClass
	
	| class |
	class := Smalltalk globals at: self className ifAbsent: [ ^ nil ].
	self classIsMeta ifTrue: [ class := class classSide ].
	^ class