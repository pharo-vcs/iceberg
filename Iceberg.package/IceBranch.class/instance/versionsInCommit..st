commits
versionsInCommit: commit
	^ self versionDictionary values flattened select: [ :version | version commitId = commit id ]

