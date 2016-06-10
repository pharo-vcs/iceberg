querying
incommingCommits
	| loadedVersions incommingCommits |
	loadedVersions := self workingCopies collect: [ :wc | self versionDescriptorFor: wc versionInfo  ].
	incommingCommits := OrderedCollection new.
	
	self allCommits do: [ :commit | 
		(loadedVersions anySatisfy: [ :entry | entry commitID hex = commit commitId ])
			ifTrue: [ ^ incommingCommits ]
			ifFalse: [incommingCommits add: commit]].
		
	^ incommingCommits.
	