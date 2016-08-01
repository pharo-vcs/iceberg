comparing
isAncestorOf: anotherCommit
	"Warning: this method considers that a commit is ancestor of itself."
	^ self = anotherCommit or: [ 
		self parents anySatisfy: [ :parent | 
			parent isAncestorOf: anotherCommit  ]]