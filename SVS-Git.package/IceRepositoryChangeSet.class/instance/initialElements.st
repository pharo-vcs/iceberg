initialization
initialElements
	^ (Ice workingCopiesForRepository: repository) 
		collect: [ :wc |
			IcePackageChangeSet 
				fromWorkingCopy: wc 
				toRepository: repository ]