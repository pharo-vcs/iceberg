private actions
newIssueFixAction
	^ GLMGenericAction new
		action: [ :presentation | 
			self 
				newFogbugzIssueFor: presentation selection repository
				then: [ presentation pane browser update ] ];
		category: 'Pharo';
		showTitle: 'Create new branch from FogBugz issue...'; 
		yourself	