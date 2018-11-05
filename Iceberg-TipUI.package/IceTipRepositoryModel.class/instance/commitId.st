accessing
commitId
	^ [ self entity headCommit id ] on: Error do: [ nil ].