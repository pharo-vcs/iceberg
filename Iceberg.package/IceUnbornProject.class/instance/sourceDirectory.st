accessing
sourceDirectory

	"Tricky method.
	If there is no project meta-data, we should try to use the projec configured by the user.
	In case this project is **that one**, return the empty source directory"
	^ commitish isWorkingCopy
		ifTrue: [ '' ]
		ifFalse: [ commitish project sourceDirectory ]