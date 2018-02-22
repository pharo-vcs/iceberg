building
build
	
	| commonAncestor sourceDiff targetDiff |
	commonAncestor := source commonAncestorWith: target.
	sourceDiff := IceDiff from: source to: commonAncestor.
	targetDiff := IceDiff from: target to: commonAncestor.
	
	"HERE I WAS"
	
	sourceDiff accept: (IcePatchVisitor new
		merge: self;
		diff: sourceDiff;
		yourself).
	1 applyDiff: targetDiff.
	1 halt.