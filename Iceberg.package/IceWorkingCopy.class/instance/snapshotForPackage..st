private-monticello
snapshotForPackage: aPackage 
	
	^ (aPackage isLoaded and: [ aPackage isModified ])
		ifTrue: [ (MCPackage named: aPackage name) snapshot ]
		ifFalse: [ self referenceCommit snapshotForPackage: aPackage ]