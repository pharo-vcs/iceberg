initialization
initializePresenter
	super initializePresenter.
	self typeList 
		items: self class availableTypes;
		displayBlock: [ :each | each  ];
		setSelectedItem: self class defaultType