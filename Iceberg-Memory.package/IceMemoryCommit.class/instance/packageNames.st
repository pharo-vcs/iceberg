accessing
packageNames
	
	^ mcCommit dependencies collect: [ :each | each name ]