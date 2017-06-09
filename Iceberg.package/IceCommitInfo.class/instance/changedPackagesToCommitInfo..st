accessing
changedPackagesToCommitInfo: aCommitInfo
	| files packageNames |
	files := self backend changedFilesBetween: self and: aCommitInfo.
	packageNames := (files 
		select: [ :each | each includesSubstring: '.package' ] 
		thenCollect: [ :each | each copyUpTo: $.])
		asSet.
	^ packageNames sorted 
		collect: [ :each | self repository packageNamed: each ]