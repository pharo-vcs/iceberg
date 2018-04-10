as yet unclassified
packagesPresentOn: aCommitish
	"Answer a list of package names present on this commit"

	| writerClass tree dir sourceEntries |
	writerClass := self writerClass.
	tree := (LGitCommit of: self repositoryHandle fromId: (LGitId fromHexString: aCommitish id)) tree.
	self flag: #todo.	"this needs to change with multiple dirs"
	dir := self subdirectory.
	sourceEntries := dir isEmptyOrNil
		ifTrue: [ tree entries ]
		ifFalse: [ (tree entryByPath: dir ifAbsent: [ nil ]) ifNotNil: #entries ifNil: [ #() ] ].
	^ sourceEntries
		select: [ :each | writerClass isValidPackageEntry: each ]
		thenCollect: [ :each | writerClass packageNameFromDirectoryName: each filename ]