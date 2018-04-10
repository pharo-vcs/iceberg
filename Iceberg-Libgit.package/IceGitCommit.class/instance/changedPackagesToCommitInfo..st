TOMOVE
changedPackagesToCommitInfo: aCommitInfo
	| writerClass files packageNames |
	
	writerClass := self repository writerClass.
	files := self repository changedFilesBetween: self and: aCommitInfo.
	self repository subdirectory ifNotEmpty: [ :subDir |
		files := files 
			select: [ :each | each beginsWith: subDir, '/' ]
			thenCollect: [ :each | each allButFirst: (subDir size + 1) ] ].
	packageNames := ((files 
		collect: [ :each | each copyUpTo: $/ ]
		thenSelect: [ :each | writerClass isValidPackageName: each ]))
		collect: [ :each | writerClass packageNameFromDirectoryName: each ] as: Set.
	^ packageNames sorted collect: [ :each | IcePackage named: each repository: self repository ]