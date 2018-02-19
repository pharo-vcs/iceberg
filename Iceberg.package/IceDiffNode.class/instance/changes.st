accessing
changes
	
	^ node changes collect: [ :e | IceDiffNode on: e diff: diff ]