communication with model
workingCopyChanges
	workingCopyDiff ifNil: [ workingCopyDiff := IceWorkingCopyDiff forRepository: self repository ].
	^ workingCopyDiff elements