initialization
initializeWidgets
	contentPanel := self emptyPanel asSpecAdapter.
	typeList := self newTable.
	self initializeTypeList.
			
	self whenBuiltDo: [ :ann |
		self addShortcutsTo: ann widget.
		self selectFirst ].

	self focusOrder 
		add: self typeList;
		add: self contentPanel