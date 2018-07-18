API-packages
packagesFrom: aCommit
	
	self repository handleLibgitError: [ | writerClass sourceFileReference |
		writerClass := self writerClass.
		sourceFileReference :=  aCommit fileSystem resolve: self sourceDirectory.
		sourceFileReference exists ifFalse: [ ^ #() ].
		
		^ sourceFileReference children
			select: [ :each | writerClass isValidPackageName: each basename ]
			thenCollect: [ :each | | packageName |
				packageName := writerClass packageNameFromDirectoryName: each basename.
				IcePackage named: packageName repository: self repository ] ]