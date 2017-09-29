private actions
installGroupsBaselineAction
	^ GLMGenericAction new
		action: [ :presentation | self installBaselineGroups: presentation selection entity ];
		category: 'Metacello';
		showTitle: 'Install baseline...'; 
		yourself	