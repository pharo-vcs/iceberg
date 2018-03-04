actions
browseRepositoryVersion
	| snapshot |
	
	snapshot := self entity mcSnapshot.
	(MCSnapshotBrowser forSnapshot: snapshot)
		showLabelled: 'Snapshot for ', self entity name