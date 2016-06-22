querying
loadAllCommits
	| lines currentLine |
	lines := OrderedCollection new.
	(self command: 'log --format=|%H|%an|%ai|%p|%s') linesDo: [ :line |
		(line beginsWith: '|')
			ifTrue:  [ 
				currentLine ifNotNil: [ lines add: currentLine contents ].
				currentLine := WriteStream with: line ]
			ifFalse: [ 
				currentLine cr; nextPutAll: line ]].
		
	currentLine ifNotNil: [ lines add: currentLine contents ].
	
	^ lines collect: [ :line | IceCommitInfo from: line repository: self ]
