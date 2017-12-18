instance-creation
for: anIceRepository
	
	anIceRepository workingCopy isLoaded
		ifFalse: [ ^ IceNotLoaded on: anIceRepository ].
	
	self error: 'Non implemented yet'