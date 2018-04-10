private
collectCommitsFor: aMethod path: aPath
	| commit pathSpec options commits |

	commit := self repository headCommit.
	pathSpec := LGitPathSpec withAll: { aPath }.
	options := LGitDiffOptions defaults.
	options pathspec: (LGitStringArray withAll: { aPath }).

	commits := OrderedCollection new.
	self repository newCommitWalk 
		fromCommit: commit;
		rawResultsDo: [ :eachCommit | | parents tree | 
			parents := eachCommit numberOfParents.
			tree := eachCommit tree.
			parents = 0 
				ifTrue: [
					(tree matchesPathSpec: pathSpec)
						ifTrue: [ commits add: eachCommit ] ]
				ifFalse: [ 
					eachCommit parents do: [ :eachParent | | diff |
						diff := tree diffTo: eachParent tree options: options. 
						diff numberOfDeltas > 0 
							ifTrue: [ commits add: eachCommit ] ] ] ].

	^ commits