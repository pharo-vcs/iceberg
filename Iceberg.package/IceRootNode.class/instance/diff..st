accessing
diff: anotherTree
	
	^ IceTreeDiff new
		source: self;
		target: anotherTree;
		build;
		yourself