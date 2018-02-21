accessing
changes
	
	^ node children collect: [ :e | IceDiffNode on: e diff: diff ]