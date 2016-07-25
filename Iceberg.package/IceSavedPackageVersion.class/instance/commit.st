accessing
commit
	^ commit ifNil: [ commit := 
		self repository commitAt: self commitId ]