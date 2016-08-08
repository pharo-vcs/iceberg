commits
commitsNotIn: anIceBranch 
	^ self commits reject: [:mine | anIceBranch commits anySatisfy: [:theirs | mine isAncestorOf: theirs]]