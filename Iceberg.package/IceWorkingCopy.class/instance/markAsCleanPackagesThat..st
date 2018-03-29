API-packages
markAsCleanPackagesThat: aBlock
	
	self modifiedPackages do: [ :each |
		(aBlock value: each) ifTrue: [ each beClean ] ]