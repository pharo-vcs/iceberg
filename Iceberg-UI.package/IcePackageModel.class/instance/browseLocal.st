actions
browseLocal
	| snapshot |
	
	snapshot := self repository branch snapshotFor: self package.
	(MCSnapshotBrowser forSnapshot: snapshot)
		showLabelled: 'Snapshot for ', self package name