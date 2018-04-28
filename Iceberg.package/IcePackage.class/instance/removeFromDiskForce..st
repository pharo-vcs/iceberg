actions
removeFromDiskForce: force

	(self isLoaded and: [ force not ]) ifTrue: [ 
		IceError signal: 'You can''t remove a loaded package.' ].
	repository workingCopy basicRemovePackage: self