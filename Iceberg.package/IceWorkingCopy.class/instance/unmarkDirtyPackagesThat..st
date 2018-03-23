private-monticello
unmarkDirtyPackagesThat: aBlock
	
	self modifiedPackages do: [ :each |
		(aBlock value: each)
			ifTrue: [ each mcWorkingCopy modified: false ] ]