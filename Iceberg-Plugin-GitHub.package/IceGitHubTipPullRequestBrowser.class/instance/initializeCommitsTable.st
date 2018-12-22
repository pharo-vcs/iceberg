initialization
initializeCommitsTable
	| textStylingBlock |
	textStylingBlock := [ :string :commit | 
	commit isMerged
		ifTrue: [ string asText ]
		ifFalse: [ string asText allBold ] ].
	
	commits widget
		beResizable;
		addColumn: (IceTipTableColumn id: 'Date & time' action: [ :commit | textStylingBlock value: commit datetime asLocalStringYMDHM value: commit ] width: 120 * World displayScaleFactor);
		addColumn: (IceTipTableColumn id: 'Id' action: [ :commit | textStylingBlock value: commit shortId value: commit ] width: 50 * World displayScaleFactor);
		addColumn: (IceTipTableColumn id: 'Author' action: [ :commit | textStylingBlock value: commit author value: commit ] width: 120 * World displayScaleFactor);
		addColumn: (IceTipTableColumn id: 'Comment' action: [ :commit | textStylingBlock value: commit comment value: commit ] width: 300 * World displayScaleFactor);
		dataSource: self newCommitsDataSource;
		selectRowIndex: 1