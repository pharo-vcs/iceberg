private
replacePanelWith: aType
	| panelMorph |
	
	panelMorph := self contentPanel morph.
	panelMorph removeAllMorphs.
	 
	aType ifNil: [ ^ self ].
	panelMorph 
		addMorph: aType buildWithSpec 
		fullFrame: LayoutFrame identity