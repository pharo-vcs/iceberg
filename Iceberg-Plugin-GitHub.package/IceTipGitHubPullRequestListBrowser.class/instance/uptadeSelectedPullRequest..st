as yet unclassified
uptadeSelectedPullRequest: anEvent
	self details pullRequest: (anEvent newSelectedRowIndexes ifNotEmpty: [ :indexes | self pullRequests widget dataSource elementAt: indexes first ] ifEmpty: [ IceGitHubNilPullRequest new ])