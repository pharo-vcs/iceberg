initialization
initializeWidgets
	self repositoryPanel: self emptyPanel asSpecAdapter.
	typeList := self newList
		items: self allTypes;
		displayBlock: [ :each | each title ];
		icons: [ :each | each icon ];
		yourself.
		
	typeList whenSelectedItemChanged: [ :aType |
		type := aType.
		self replaceRepositoryPanelWith: aType.
		self title: aType title ].
	
	self focusOrder 
		add: self typeList;
		add: self repositoryPanel