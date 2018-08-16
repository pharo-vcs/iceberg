API-packages
packages
	
	self repository handleLibgitError: [ | writerClass sourceFileReference |
		writerClass := self writerClass.
		sourceFileReference := commitish fileSystem resolve: self sourceDirectoryPath.
		sourceFileReference exists ifFalse: [ ^ #() ].
		
		^ sourceFileReference children
			select: [ :each | writerClass isValidPackage: each ]
			thenCollect: [ :each | | packageName |
				packageName := writerClass packageNameFromDirectory: each.
				IcePackage named: packageName repository: self repository ] ]