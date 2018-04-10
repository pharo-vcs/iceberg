accessing
ancestors
	
	^ ancestorIds collect: [ :each | repository lookupCommit: each ]