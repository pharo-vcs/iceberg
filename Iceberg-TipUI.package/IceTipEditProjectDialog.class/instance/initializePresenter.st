initialization
initializePresenter

	super initializePresenter.
	self formatList
		items: self formats;
		displayBlock: [ :each | each description ];
		setSelectedItem: self defaultFormat