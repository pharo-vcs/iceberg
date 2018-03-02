instance-creation
for: anIceRepository
		
	anIceRepository workingCopy isDetached
		ifTrue: [ ^ IceDetachedWorkingCopy on: anIceRepository ].
		
	anIceRepository head isDetached
		ifTrue: [ ^ IceDetachedHead on: anIceRepository ].
	
	anIceRepository workingCopy isModified
		ifTrue: [ ^ IceModifiedWorkingCopy on: anIceRepository ].
		
	^ IceSynchronizedWorkingCopy on: anIceRepository