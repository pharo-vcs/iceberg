accessing
repositoriesLocation
 	^ (self shareRepositoriesBetweenImages 
		ifTrue: [ self sharedRepositoriesLocation ]
		ifFalse: [ FileLocator localDirectory absolutePath / #iceberg ]) asFileReference 