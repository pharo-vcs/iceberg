utilities
mergeIntoAnotherBranch: aCommit andThen: aBlock
	"Merge selected commit into another branch"
	| branches selection |
	branches := aCommit repository branchesForMerge.
	selection := self uiManager
		chooseFrom: (branches collect: #displayName)
		values: branches
		message: ('Select the branch into you want to merge commit {1}' format: {aCommit shortId})
		title: 'Merge your changes into another branch'.

	selection ifNotNil: [ 
		aCommit mergeInto: selection.
		aBlock value 
	]
