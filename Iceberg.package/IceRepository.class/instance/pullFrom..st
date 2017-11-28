actions
pullFrom: aRemote
	| currentCommit |
	
	self validateCanPull.
	
	currentCommit := self loadedCode referenceCommit.
	self backend pullFrom: aRemote.
	self refreshTo: self headCommit.
	(self headCommit changedPackagesTo: currentCommit) do: #loadLatest
