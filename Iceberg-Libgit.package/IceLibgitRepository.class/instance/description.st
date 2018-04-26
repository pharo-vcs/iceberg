printing
description
	^ [ super description ] on: Error do: [ 
		location isNil
			ifTrue: [ 'Not specified location' ]
			ifFalse: [ 'Bad location: ', location path pathString ] ]