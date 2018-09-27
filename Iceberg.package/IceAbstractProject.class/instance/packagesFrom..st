API-packages
packagesFrom: aCommit
	
	self repository handleLibgitError: [ | writerClass sourceFileReference |
		writerClass := self writerClass.
		sourceFileReference :=  aCommit fileSystem resolve: self sourceDirectory.
		sourceFileReference exists ifFalse: [ ^ #() ].
		
		^ sourceFileReference children
			select: [ :each | writerClass isValidPackage: each ]
			thenCollect: [ :each | | packageName |
				packageName := writerClass packageNameFromDirectory: each basename.
				IcePackage named: packageName repository: self repository ] ]