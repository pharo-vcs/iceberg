accessing
refresh
	self leftPanel widget removeAllMorphs.
	self rightPanel widget removeAllMorphs.
	items do: [ :each |  
		each position 
			addButton: (each newToolbarButtonOn: self) 
			into: self ]