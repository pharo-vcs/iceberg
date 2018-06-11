printing
hostDescription
	^ host = #'*' ifTrue: [ 'Default' ] ifFalse: [ host ]