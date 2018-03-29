building
buildFull

	| leftTree rightTree |
	leftTree := IceNode value: IceRootDefinition new.
	rightTree := IceNode value: IceRootDefinition new.
	
	"Image changes should be processed before commit changes to take into account changes in the image"
	(source loadedPackages collect: [ :package | IceImageChange package: package ]) asArray,
		(source referenceCommit changesTo: target)
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