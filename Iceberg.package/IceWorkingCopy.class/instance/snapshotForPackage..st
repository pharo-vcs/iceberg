private-monticello
snapshotForPackage: aPackage 
	
	^ aPackage isLoaded
		ifTrue: [ (MCPackage named: aPackage name) workingCopy snapshot ]
		ifFalse: [ self referenceCommit snapshotForPackage: aPackage ]