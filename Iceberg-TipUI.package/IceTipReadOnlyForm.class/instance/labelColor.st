accessing
labelColor
	^ labelColor ifNil: [ labelColor := Smalltalk ui theme textColor ]