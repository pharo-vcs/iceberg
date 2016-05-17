initialization
changes
	^ self parent changes select: [ :change | 
		change targetClass notNil and: [ change targetClass package mcPackage = self package ] ]