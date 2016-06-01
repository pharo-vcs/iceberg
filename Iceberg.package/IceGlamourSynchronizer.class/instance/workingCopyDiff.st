communication with model
workingCopyDiff
	^ workingCopyDiff ifNil: [ workingCopyDiff := IceWorkingCopyDiff forRepository: self repository ].
