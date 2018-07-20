building
buildFull

	| leftTree rightTree |
	leftTree := IceNode value: IceRootDefinition new.
	rightTree := IceNode value: IceRootDefinition new.
		
	"Image changes should be processed before commit changes to take into account changes in the image"
	self imageChanges , (source referenceCommit changesTo: target) asArray
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
				yourself) ] displayingProgress: [ :change | change displayingProgressString ].

	tree := self diff: leftTree with: rightTree