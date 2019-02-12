accessing
selectedPullRequest
	| table |
	table := self pullRequests widget.
	^ table dataSource elementAt: table selectedIndex 