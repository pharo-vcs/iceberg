walk definition
uptoCommits: aCollection 
	aCollection do: [ :commit | self basicUpto: commit id ]