accessing
refresh
	self leftPanel removeAllMorphs.
	self rightPanel removeAllMorphs.
	items do: [ :each |  
		each position 
			addButton: (each newToolbarButtonOn: self) 
			into: self ]