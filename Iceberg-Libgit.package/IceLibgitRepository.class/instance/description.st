printing
description
	^ [ super description ] on: Error do: [ 
		self location isNil
			ifTrue: [ 'Not specified location' ]
			ifFalse: [ 'Bad location: ', self location path pathString ] ]