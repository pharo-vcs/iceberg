snapshotting
fillSnapshot: anIceSnapshot fromVersion: aVersion
	
	anIceSnapshot addDefinition: (IcePackageDefinition 
		package: self package
		snapshot: ([(aVersion snapshotForPackage: self package)]
			on: IceVersionDoesNotExist do: [ MCSnapshot empty ] ))