instance creation
major: majorNumber minor: minorNumber patch: patchNumber
	^ self basicNew 
		initializeMajor: majorNumber 
			minor: minorNumber 
			patch: patchNumber;
		yourself