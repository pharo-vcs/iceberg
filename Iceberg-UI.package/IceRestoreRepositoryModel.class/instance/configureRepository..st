private
configureRepository: aRepository
	repository location = aRepository location 
		ifFalse: [ repository location: aRepository location ].
	repository subdirectory = aRepository subdirectory 
		ifFalse: [ repository subdirectory: aRepository subdirectory ]
