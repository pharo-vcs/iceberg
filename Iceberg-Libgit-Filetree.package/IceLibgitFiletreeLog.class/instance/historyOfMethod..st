accessing
historyOfMethod: aMethod
	| path commit pathSpec options history |
	
	path := self fileNameForMethod: aMethod.

	commit := self repository branch lastCommit.
	pathSpec := LGitPathSpec withAll: { path }.
	options := LGitDiffOptions defaults.
	options pathspec: (LGitStringArray withAll: { path }).

	history := OrderedCollection new.
	self repository newCommitWalk 
		fromCommit: commit;
		rawResultsDo: [ :eachCommit | | parents tree | 
			parents := eachCommit numberOfParents.
			tree := eachCommit tree.
			parents = 0 
				ifTrue: [
					(tree matchesPathSpec: pathSpec)
						ifTrue: [ history add: eachCommit ] ]
				ifFalse: [ 
					eachCommit parents do: [ :eachParent | | diff |
						diff := tree diffTo: eachParent tree options: options. 
						diff numberOfDeltas > 0 
							ifTrue: [ history add: eachCommit ] ] ] ].
	^ history collect: [ :each | IceLibgitRepositoryBackend parseCommitInfo: each ]