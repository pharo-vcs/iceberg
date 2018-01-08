accessing-monticello
mcSnapshot

	^ self isLoaded
		ifTrue: [ self mcWorkingCopy snapshot ]
		ifFalse: [ MCSnapshot empty ]