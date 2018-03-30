accessing
goferReferences
	^ self repository workingCopy packages 
		collect: [ :package | 
			GoferResolvedReference 
				name: package latestVersion info name 
				repository: self ]