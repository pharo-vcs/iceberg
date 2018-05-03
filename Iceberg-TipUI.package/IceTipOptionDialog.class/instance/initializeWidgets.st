initialization
initializeWidgets
	contentPanel := self emptyPanel asSpecAdapter.
	typeList := self newIceTable.
	self initializeTypeList.
			
	self whenBuiltDo: [ :ann |
		self addShortcutsTo: ann widget.
		self selectFirst ].

	self eventKeyStrokesForNextFocus do: [:each |
		typeList widget bindKeyCombination: each toAction: [ self giveFocusToNextFrom: typeList ] ].
	self eventKeyStrokesForPreviousFocus do: [:each |
		typeList widget bindKeyCombination: each toAction: [ self giveFocusToPreviousFrom: typeList ] ].
		
	self refreshFocusOrder.