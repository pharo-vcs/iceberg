accessing-monticello
mcWorkingCopy
	
	^ self isLoaded ifTrue: [
		MCWorkingCopy forPackage: (MCPackage named: self packageName) ]