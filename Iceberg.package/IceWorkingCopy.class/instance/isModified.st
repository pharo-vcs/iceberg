testing
isModified
	
	^ self packages anySatisfy: [ :mcPackage | mcPackage workingCopy modified ]