repository handling
gitCommand: anArrayOfStrings
	^ self repository 
		gitCommand: anArrayOfStrings 
		in: self repository directory