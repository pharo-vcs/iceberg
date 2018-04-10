actions
browseRepositoryVersion
	<noCache>
	| snapshot |
	
	snapshot := self entity mcSnapshotInRepository.
	(MCSnapshotBrowser forSnapshot: snapshot)
		showLabelled: 'Snapshot for ', self entity name