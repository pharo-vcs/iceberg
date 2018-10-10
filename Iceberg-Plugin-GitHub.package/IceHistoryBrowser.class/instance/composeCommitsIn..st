building
composeCommitsIn: composite
	composite fastTable
		title: 'Commits';
		display: #commits;
		column: 'Date & time' 
			evaluated: [:commit | 
				commit datetime asLocalStringYMDHM asText 
					in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] 
			width: 120 * World displayScaleFactor;
		column: 'Id' evaluated: [ :commit |
			commit shortId asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 50 * World displayScaleFactor;
		column: 'Author' evaluated: [ :commit |
			commit author asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 120 * World displayScaleFactor;
		column: 'Parents' evaluated: [ :commit |
			(', ' join: commit ancestors) asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 100 * World displayScaleFactor;
		column: 'Comment' evaluated: [ :commit |
			commit comment asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 300 * World displayScaleFactor;
		
		addSelectionAction: self inspectAction
