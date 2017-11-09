execute
execute
	| commit |
	commit := self repository headCommit.
	commit mergeIntoImage.
	success := self repository loadedCode referenceCommit = commit