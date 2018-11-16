accessing
refresh
	leftPanel removeAllMorphs.
	rightPanel removeAllMorphs.
	items do: [ :each |
		each position 
			addItem: (each newStatusBarItemOn: self) 
			into: self ]