private actions
installRepositoryGroupsBaselineAction: icePackage
	^ GLMGenericAction new
		action: [ :presentation | self installBaselineGroups: icePackage ];
		category: 'Metacello';
		showTitle: ('Install baseline of {1}...' format: { icePackage name allButFirst: 10}); 
		yourself	