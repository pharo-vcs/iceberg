initialization
initializeWidgets
	contentPanel := self emptyPanel asSpecAdapter.
	typeList := self newList
		items: self allTypes;
		displayBlock: [ :each | each title ];
		icons: [ :each | each icon ];
		yourself.
		
	typeList whenSelectedItemChanged: [ :aType |
		type := aType.
		self replacePanelWith: aType.
		self title: aType title ].
		
	self whenBuiltDo: [ :ann |
		self addShortcutsTo: ann widget ].

	self focusOrder 
		add: self typeList;
		add: self contentPanel