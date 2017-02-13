private actions
newIssueFixAction
	^ GLMGenericAction new
		action: [ :presenter | self newFogbugzIssueFor: presenter selection repository ];
		category: 'Pharo';
		showTitle: 'New branch from FogBugz issue...'; 
		yourself	