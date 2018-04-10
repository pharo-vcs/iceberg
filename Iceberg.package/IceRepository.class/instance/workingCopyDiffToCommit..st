*Iceberg-Changes
workingCopyDiffToCommit: anIceCommitInfo

	^ IceDiff
		from: self workingCopy
		to: anIceCommitInfo commit