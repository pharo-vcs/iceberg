private actions
installRepositoryDefaultBaselineAction: icePackage
	^ GLMGenericAction new
		action: [ :presentation | self installDefaultBaseline: icePackage ];
		category: 'Metacello';
		showTitle: ('Install baseline of {1} (default)' format: { icePackage name allButFirst: 10}); 
		yourself	