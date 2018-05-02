private
replacePanelWith: aType
	| panelMorph specPanel |
	
	panelMorph := self contentPanel morph.
	panelMorph removeAllMorphs.
	
	aType ifNil: [ ^ self ].
	specPanel := aType buildWithSpec.
	panelMorph 
		addMorph: specPanel
		fullFrame: LayoutFrame identity.

	self eventKeyStrokesForNextFocus do: [:each |
		aType bindKeyCombination: each toAction: [ self giveFocusToNextFrom: specPanel ] ].
	self eventKeyStrokesForPreviousFocus do: [:each |
		aType bindKeyCombination: each toAction: [ self giveFocusToPreviousFrom: specPanel ] ].

	self refreshFocusOrder