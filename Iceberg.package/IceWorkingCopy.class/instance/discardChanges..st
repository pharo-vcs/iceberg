API-changes
discardChanges: aTree
	
	self loadChangesInWorkingCopy: (aTree collect: [ :definition |
		definition inverse ]).
	self refreshDirtyPackages