private-packages
unmarkDirtyPackagesThat: aBlock
	
	self modifiedPackages do: [ :each |
		(aBlock value: each) ifTrue: [ each beClean ] ]