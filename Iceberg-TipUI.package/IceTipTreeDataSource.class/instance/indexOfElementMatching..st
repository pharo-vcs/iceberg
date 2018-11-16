accessing
indexOfElementMatching: aBlock
	1 to: self numberOfRows do: [ :index |
		(aBlock value: (self realElementAt: index)) 
			ifTrue: [ ^ index ] ].
	^ 0