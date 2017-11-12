actions
pullFrom: aRemote
	| currentCommit |
	currentCommit := self loadedCode referenceCommit.
	self backend pullFrom: aRemote.
	self refreshTo: self headCommit.
	(self headCommit changedPackagesTo: currentCommit) do: #loadLatestt
