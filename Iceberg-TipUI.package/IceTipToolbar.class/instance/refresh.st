accessing
refresh
	barPanel widget removeAllMorphs.
	items do: [ :each |  
		each position 
			addButton: (each buildToolbarButtonOn: self) 
			into: self ]