private-commits
commitPackage: aMCPackage author: aString ancestors: ancestors dependencies: dependencies inInternalRepository: aRepository 
	
	^ self
		commitPackage: aMCPackage
		author: aString
		message: ''
		ancestors: ancestors
		dependencies: dependencies
		inInternalRepository: aRepository