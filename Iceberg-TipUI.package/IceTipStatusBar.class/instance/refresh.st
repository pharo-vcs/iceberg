accessing
refresh
	panel widget removeAllMorphs.
	items do: [ :each |  
		panel widget addMorphBack: ((each newStatusBarItemOn: self)
			vResizing: #spaceFill;
			cellPositioning: #center; 
			yourself) ]