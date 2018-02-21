building
build

	| leftTree rightTree |
	"self buildSourceDirectory."
	
	leftTree := IceNode value: IceRootDefinition new.
	rightTree := IceNode value: IceRootDefinition new.
	
	(source changesTo: target) do: [ :change | 
		change accept: (IceDiffNodeBuilder new
			version: source;
			diff: self;
			parentNode: leftTree;
			yourself).
			
		change accept: (IceDiffNodeBuilder new
			version: target;
			diff: self;
			parentNode: rightTree;
			yourself) ].
		
	tree := IceTreeDiff new
		source: leftTree;
		target: rightTree;
		build