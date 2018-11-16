building
buildForPackages: aCollection

	| leftTree rightTree |

	leftTree := IceNode value: IceRootDefinition new.
	rightTree := IceNode value: IceRootDefinition new.
	
	(aCollection collect: [ :package | IceImageChange package: package ])
		do: [ :change | 
			change accept: (IceChangeImporter new
				version: source;
				diff: self;
				parentNode: leftTree;
				yourself).
				
			change accept: (IceChangeImporter new
				version: target;
				diff: self;
				parentNode: rightTree;
				yourself) ].

	tree := self diff: leftTree with: rightTree