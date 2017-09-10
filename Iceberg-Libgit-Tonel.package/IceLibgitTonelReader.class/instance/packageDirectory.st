accessing
packageDirectory
	^ packageDirectory ifNil: [ 
		packageDirectory := self repository location resolvePath: self package directoryPathString ]