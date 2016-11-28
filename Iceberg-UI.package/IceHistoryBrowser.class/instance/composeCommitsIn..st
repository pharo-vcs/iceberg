building
composeCommitsIn: composite
	composite fastTable
		title: 'Commits';
		display: #commits;
		column: 'Date & time' 
			evaluated: [:commit | 
				commit datetime asLocal asStringYMDHM asText in: [ :text | 
					commit isLoaded ifTrue: text ifFalse: [text allBold]]] 
			width: 120;
		column: 'Id' evaluated: #shortId width: 50;
		column: 'Parents' evaluated: [ :commit | ', ' join: (commit parents collect: #shortId) ] width: 100;
		column: 'User' evaluated: #username width: 120;
		column: 'Comment' evaluated: #comment width: 300;
		addSelectionAction: self inspectAction;
		addSelectionAction: self mergeIntoAction.
