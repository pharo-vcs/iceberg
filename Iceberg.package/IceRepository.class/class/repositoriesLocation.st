accessing
repositoriesLocation
 	^ self shareRepositoriesBetweenImages 
		ifTrue: [ self sharedRepositoriesLocation ]
		ifFalse: [ FileLocator workingDirectory absolutePath / #iceberg ]