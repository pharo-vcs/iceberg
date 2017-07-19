actions
pullFrom: aRemote
	| currentCommit |
	currentCommit := self loadedCode referenceCommit.
	self backend pullFrom: aRemote.
	self refresh.
	(self headCommit changedPackagesTo: currentCommit) do: #loadLatest