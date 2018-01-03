actions
basicMerge: aCommitInfo
	"Try automatic merge handled by the (git?) repository itself. 
	Will raise an IceMergeAborted in case that automatic merge 
	detects conflicts that have to be solved manually."
	| currentCommit |
	currentCommit := self workingCopy referenceCommit.
	self doMergeCommitId: aCommitInfo id.
	(self headCommit changedPackagesTo: currentCommit) do: #loadLatest
