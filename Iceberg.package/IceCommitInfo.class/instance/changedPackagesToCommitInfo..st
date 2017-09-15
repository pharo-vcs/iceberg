accessing
changedPackagesToCommitInfo: aCommitInfo
	| writerClass files packageNames |
	
	writerClass := self backend writerClass.
	files := self backend changedFilesBetween: self and: aCommitInfo.
	self backend subdirectory ifNotEmpty: [ :subDir |
		files := files 
			select: [ :each | each beginsWith: subDir, '/' ]
			thenCollect: [ :each | each allButFirst: (subDir size + 1) ] ].
	packageNames := ((files 
		collect: [ :each | each copyUpTo: $/ ]
		thenSelect: [ :each | writerClass isValidPackageName: each ]))
		collect: [ :each | writerClass packageNameFromDirectoryName: each ] as: Set.
	^ packageNames sorted
		select: [ :each | self repository includesPackageNamed: each ]
		thenCollect: [ :each | self repository packageNamed: each ]