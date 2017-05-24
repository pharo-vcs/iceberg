private actions
newIssueFixAction
	^ GLMGenericAction new
		action: [ :presentation | 
			self 
				newFogbugzIssue: presentation selection repository
				then: [ presentation pane browser update ] ];
		category: 'Pharo';
		showTitle: 'Create new branch from FogBugz issue...'; 
		condition: [ :presentation | self isAvailableFor: presentation selection repository]
		yourself	