execute
execute
	| commit |
	commit := self repository headCommit.
	commit mergeIntoImage.
	(self repository loadedCode referenceCommit = commit)
		ifTrue: [ self beSuccess ]