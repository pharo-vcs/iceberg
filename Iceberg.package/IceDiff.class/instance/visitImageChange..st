visiting
visitImageChange: anIceImageChange
	
	^ anIceImageChange accept: (IceDiffNodeBuilder new
		diff: self;
		parentNode: tree;
		yourself)