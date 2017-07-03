querying
packagesPresentOn: aCommitish
	"Answer a list of package names present on this commit"
	self withRepoDo: [ :repo | | tree dir sourceEntries |
		tree := (LGitCommit of: repo fromId: (LGitId fromHexString: aCommitish id)) tree.
		self flag: #todo. "this needs to change with multiple dirs"
		dir := self subdirectory.
		sourceEntries := dir isEmptyOrNil
			ifTrue: [ tree entries ]
			ifFalse: [ (tree entryByPath: dir) entries ]. 
		^ ((sourceEntries 
			collect: [ :each | each filename ])
			select: [ :each | each endsWith: '.package' ])
			collect: [ :each | each copyFrom: 1 to: (each findString: '.package') - 1 ] ]