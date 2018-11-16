API-tags
tags
	self handleLibgitError: [ 
		^ self repositoryHandle tags
			collect: [ :each | 
				IceTag named: each inRepository: self ] ]