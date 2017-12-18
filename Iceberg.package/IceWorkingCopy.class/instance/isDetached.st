testing
isDetached

	| commit |
	commit := self referenceCommit.
	self assert: commit size = 1.
	
	^ commit first ~= repository head commit