building
build
	mergedTree := sourceTree simmetricDifference: targetTree.
	"mergedTree accept: (IceDiffCalculator new 
		diff: self;
		yourself)."