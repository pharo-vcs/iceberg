updating
updateIndex: anIceDiff 

	anIceDiff tree
		accept: (IceIndexUpdateVisitor new
			index: self;
			diff: anIceDiff).