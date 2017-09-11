private actions
prepareToContributeAction
	"This actions are copied from GitHub plugin, but presented here to make it easier"
	^ GLMGenericAction new
		action: [ :presenter | self prepareToContribute: presenter selection repository ];
		category: 'Pharo';
		showTitle: 'Prepare for contribution'; 
		condition: [ :presentation | self isAvailableFor: presentation selection repository]
		yourself
