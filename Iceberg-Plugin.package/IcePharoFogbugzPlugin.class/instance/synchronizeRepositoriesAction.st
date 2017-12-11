private actions
synchronizeRepositoriesAction
	"This actions are copied from GitHub plugin, but presented here to make it easier"
	^ GLMGenericAction new
		action: [ :presenter | self synchronizeRepositories: presenter selection repository ];
		category: 'Pharo';
		showTitle: 'Synchonize repositories'; 
		condition: [ :presentation | self isAvailableFor: presentation selection repository]
		yourself
