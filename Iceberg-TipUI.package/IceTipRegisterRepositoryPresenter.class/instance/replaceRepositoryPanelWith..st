initialization
replaceRepositoryPanelWith: aType
	| panelMorph |
	
	panelMorph := self repositoryPanel morph.
	panelMorph removeAllMorphs.
	 
	aType ifNil: [ ^ self ].
	panelMorph 
		addMorph: aType buildWithSpec 
		fullFrame: LayoutFrame identity