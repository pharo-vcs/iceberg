accessing-monticello
mcWorkingCopy

	^ self isLoaded ifTrue: [
		self mcPackage workingCopy ]