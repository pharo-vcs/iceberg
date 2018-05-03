factory
newStatusBarItemOn: aStatusBar
	self model shortCommitId ifNil: [ ^ self model branchName asMorph ].

	^ PanelMorph new
		addMorph: self branchNameMorph;
		addMorph: self shortIdMorph;
		changeTableLayout;
		listDirection: #rightToLeft;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		yourself