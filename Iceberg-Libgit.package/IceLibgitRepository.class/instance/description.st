printing
description
	^ [ super description ] on: Error do: [ 'Bad location: ', location path pathString ]