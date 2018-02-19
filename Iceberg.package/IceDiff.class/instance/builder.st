building
builder

	^ IceDiffNodeBuilder new
		diff: self;
		parentNode: tree;
		yourself