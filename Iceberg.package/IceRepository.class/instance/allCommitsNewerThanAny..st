commits
allCommitsNewerThanAny: commitIds
	| incommingCommits |
	incommingCommits := OrderedCollection new.
	
	self commits do: [ :commit | 
		(commitIds includes: commit commitId )
			ifTrue: [ ^ incommingCommits ]
			ifFalse: [incommingCommits add: commit]].
		
	^ incommingCommits.
