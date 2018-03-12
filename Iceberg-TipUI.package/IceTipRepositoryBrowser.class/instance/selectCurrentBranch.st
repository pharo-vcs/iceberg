initialization
selectCurrentBranch
	| index branch |

	branch := self model branchModel.
	index := (sidebarTree widget dataSource 
		indexOfElementMatching: [ :each | each isLeaf and: [ each model name = branch name ] ]).
	sidebarTree widget selectRowIndex: index.
	