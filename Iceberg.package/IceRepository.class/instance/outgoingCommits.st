querying
outgoingCommits
	| lines currentLine |
	lines := OrderedCollection new.
	(self command: {'log'. 'origin/{1}..HEAD' format: {self branch}. '--format=|%H|%an|%ai|%p|%s'}) linesDo: [ :line |
		(line beginsWith: '|')
			ifTrue:  [ 
				currentLine ifNotNil: [ lines add: currentLine contents ].
				currentLine := WriteStream with: line ]
			ifFalse: [ 
				currentLine cr; nextPutAll: line ]].
	
	
	^ lines collect: [ :line | IceCommitInfo from: line repository: self ]
