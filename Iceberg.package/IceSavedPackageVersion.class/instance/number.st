accessing
number
	^ number ifNil: [ self entry info versionNumber ]