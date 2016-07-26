versions handling
versionsInCommit: commit
	^ (self branch includesCommit: commit)
		ifTrue: [ self branch versionsInCommit: commit ]
		ifFalse: [ (self upstream includesCommit: commit)
			ifTrue: [ self upstream versionsInCommit: commit ]
			ifFalse: [ self error: ('The commit {1} is not in the current branch ({2}) nor in its upstream branch, so I can not look for its versions.'
				format: {commit id. self branch name}) ]]
