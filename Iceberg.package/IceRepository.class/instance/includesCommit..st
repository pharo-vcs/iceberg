API-history
includesCommit: anIceCommit
	self lookupCommit: anIceCommit id ifAbsent: [ ^ false ].
	^ true	