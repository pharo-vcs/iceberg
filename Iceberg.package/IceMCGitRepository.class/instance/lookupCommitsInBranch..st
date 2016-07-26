querying
lookupCommitsInBranch: branchName
	| currentLine commits |
	commits := OrderedCollection new.
	
	(self command: {'log'. branchName. '--format=|%H|%an|%ai|%P|%s --reverse'}) linesDo: [ :line |
		(line beginsWith: '|')
			ifTrue:  [ 
				currentLine ifNotNil: [ commits add: (IceCommitInfo createFrom: currentLine contents) ].
				currentLine := WriteStream with: line ]
			ifFalse: [ 
				currentLine cr; nextPutAll: line ]].
		
	currentLine ifNotNil: [ commits add: (IceCommitInfo createFrom: currentLine contents) ].
	
	^ commits
