accessing
refresh
	self leftPanel removeAllMorphs.
	self rightPanel removeAllMorphs.
	items do: [ :each |  
		each position 
			addItem: (each newToolbarButtonOn: self) 
			into: self ]