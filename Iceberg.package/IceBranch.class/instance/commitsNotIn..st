commits
commitsNotIn: anIceBranch 
	^ self commits reject: [:mine | anIceBranch commits anySatisfy: [ :other | other isAncestorOf: mine ]]