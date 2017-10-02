private
workingCopyDiffSelector
	^ self isFullSync 	
		ifTrue: [ #fullWorkingCopyDiff ]
		ifFalse: [ #workingCopyDiff ]