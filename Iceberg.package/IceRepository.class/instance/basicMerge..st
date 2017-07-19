actions
basicMerge: aCommitish
	"Try automatic merge handled by the (git?) repository itself. 
	Will raise an IceMergeAborted in case that automatic merge 
	detects conflicts that have to be solved manually."
	| currentCommit |
	currentCommit := self loadedCode referenceCommit.
	self backend merge: aCommitish id.
	(self headCommit changedPackagesTo: currentCommit) do: #loadLatest
