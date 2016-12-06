commits
versionsInCommit: commit
	^ self versionDictionary values flattened select: [ :version | version commit id = commit id ]

