actions
merge: aCommitish
	"Currently a commitish can only be an IceCommitInfo, but we should be prepared for other types of commitish."

	[ 
		"First try git automatic merge "
		self backend merge: aCommitish id 
	]
		on: IceMergeAborted
		do: [ :error |
			"Let the user merge manually."
			| versionsChangedInCommit |
			versionsChangedInCommit := aCommitish versionsChangedSince: (self mergeBaseWith: aCommitish).

			(MCVersionMerger new
				addVersions: (versionsChangedInCommit collect: #mcVersion);
				merge)
				ifTrue: [ self commitAndMarkAsMerged: aCommitish ]
		]. 

