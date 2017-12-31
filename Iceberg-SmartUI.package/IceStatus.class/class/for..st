instance-creation
for: anIceRepository
	
	anIceRepository workingCopy isLoaded
		ifFalse: [ ^ IceNotLoaded on: anIceRepository ].
	
	anIceRepository workingCopy isDetached
		ifTrue: [ ^ IceDetachedWorkingCopy on: anIceRepository ].
		
	anIceRepository head isDetached
		ifTrue: [ ^ IceDetachedHead on: anIceRepository ].
	
	anIceRepository workingCopy isModified
		ifTrue: [ ^ IceModifiedWorkingCopy on: anIceRepository ].
		
	self error: 'Non implemented yet'