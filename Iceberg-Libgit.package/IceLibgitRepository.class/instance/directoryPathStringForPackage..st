API-packages
directoryPathStringForPackage: aMCPackage 

	^ self subdirectory isEmptyOrNil 
		ifTrue: [ self directoryNameForPackage: aMCPackage ]
		ifFalse: [ self subdirectory, '/',  (self directoryNameForPackage: aMCPackage) ]