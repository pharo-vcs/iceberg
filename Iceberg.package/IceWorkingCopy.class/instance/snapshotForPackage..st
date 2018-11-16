private-monticello
snapshotForPackage: aPackage 
	
	^ aPackage isLoaded
		ifTrue: [ (MCPackage named: aPackage name) basicSnapshot ]
		ifFalse: [ self referenceCommit snapshotForPackage: aPackage ]