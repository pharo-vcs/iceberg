accessing
commitModelAfter: aModel
	^ self commitModels 
		after: aModel
		ifAbsent: [ nil ]