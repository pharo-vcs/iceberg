private-monticello
snapshotForPackage: aPackage 
	
	^ aPackage isLoaded
		ifTrue: [ (MCPackage named: aPackage name) snapshot ]
		ifFalse: [ self referenceCommit snapshotForPackage: aPackage ]