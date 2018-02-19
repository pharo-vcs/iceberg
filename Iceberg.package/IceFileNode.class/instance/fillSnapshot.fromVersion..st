snapshotting
fillSnapshot: anIceSnapshot fromVersion: aVersion
	
	anIceSnapshot addDefinition: (IceFileDefinition path: self path vesion: aVersion)