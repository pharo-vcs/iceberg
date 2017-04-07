private actions
installBaselineAction
	^ GLMGenericAction new
		action: [ :presentation | self installBaseline: presentation selection entity ];
		showTitle: 'Install baseline'; 
		yourself	