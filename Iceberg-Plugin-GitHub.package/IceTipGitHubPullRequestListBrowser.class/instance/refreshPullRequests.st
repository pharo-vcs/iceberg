actions
refreshPullRequests
	| table |
	table := self pullRequests widget.
	table dataSource elements: self fetchPullRequests.
	(table hasSelection not and: [ table dataSource hasElements ])
		ifTrue: [ table selectRowIndex: 1 ]