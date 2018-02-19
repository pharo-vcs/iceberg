snapshotting
fillSnapshot: anIceSnapshot fromVersion: aVersion
	
	anIceSnapshot addDefinition: (IceFileDefinition path: self path version: aVersion)