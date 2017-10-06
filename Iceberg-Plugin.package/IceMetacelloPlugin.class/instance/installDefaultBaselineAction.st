private actions
installDefaultBaselineAction
	^ GLMGenericAction new
		action: [ :presentation | self installDefaultBaseline: presentation selection entity ];
		category: 'Metacello';
		showTitle: 'Install baseline (default)'; 
		yourself	