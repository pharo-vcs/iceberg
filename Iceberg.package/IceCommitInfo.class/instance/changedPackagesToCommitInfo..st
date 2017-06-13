accessing
changedPackagesToCommitInfo: aCommitInfo
	| files packageNames |
	files := self backend changedFilesBetween: self and: aCommitInfo.
	packageNames := (files 
		select: [ :each | each includesSubstring: '.package' ] 
		thenCollect: [ :each | | packageName |
			packageName := each copyFrom: 1 to: (each findString: '.package') - 1.
			(packageName includesSubstring: '/') 
				ifTrue: [ packageName copyAfterLast: $/ ]
				ifFalse: [ packageName ] ])
		asSet.
	^ packageNames sorted
		select: [ :each | self repository includesPackageNamed: each  ] 
		thenCollect: [ :each | self repository packageNamed: each ]