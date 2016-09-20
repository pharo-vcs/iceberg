building
buildDiffInput: change
	"The diff from an incomming change comes with the versions switched, 
	so I have to switch them again."
	^ { 
		change theirVersion ifNil: ''.
		change myVersion ifNil: ''. 
	}
