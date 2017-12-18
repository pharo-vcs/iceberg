execute
execute
	| commit |
	commit := self repository headCommit.
	commit mergeIntoWorkingCopy.
	(self repository loadedCode referenceCommit = commit)
		ifTrue: [ self beSuccess ]