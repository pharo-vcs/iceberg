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
			width: 120;
		column: 'Id' evaluated: [ :commit |
			commit shortId asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 50;
		column: 'Author' evaluated: [ :commit |
			commit author asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 120;
		column: 'Parents' evaluated: [ :commit |
			(', ' join: commit ancestors) asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 100;
		column: 'Comment' evaluated: [ :commit |
			commit comment asText in: [ :text | 
						commit isMerged
							ifTrue: [ text ] 
							ifFalse: [ text allBold ] ] ] width: 300;
		
		addSelectionAction: self inspectAction
