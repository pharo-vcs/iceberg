private
lookupCommitsInRange: rangeSpec into: aCommitRegistry
	| currentLine |
	
	(self command: {'log'. rangeSpec. '--format=|%H|%an|%ai|%P|%s --reverse'}) linesDo: [ :line |
		(line beginsWith: '|')
			ifTrue:  [ 
				currentLine ifNotNil: [ aCommitRegistry addCommit: (self class parseCommitInfo: currentLine contents) ].
				currentLine := WriteStream with: line ]
			ifFalse: [ 
				currentLine cr; nextPutAll: line ]].
		
	currentLine ifNotNil: [ 
		aCommitRegistry addCommit: (self class parseCommitInfo: currentLine contents) ].
	