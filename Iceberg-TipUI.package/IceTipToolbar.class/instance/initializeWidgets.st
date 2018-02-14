initialization
initializeWidgets
	leftPanel := self newPanel asSpecAdapter.
	rightPanel := self newPanel 
		listDirection: #rightToLeft;
		hResizing: #spaceFill;
		asSpecAdapter