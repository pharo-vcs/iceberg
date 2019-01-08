accessing
goferReferences
	
	self repository head description = projectVersion ifFalse: [ (self repository commitishNamed: projectVersion) checkoutWithStrategy: IceCheckoutDoNotLoadPackages new ].
	
	^ self repository workingCopy packages 
		collect: [ :package | 
			GoferResolvedReference 
				name: package latestVersion info name 
				repository: self ]