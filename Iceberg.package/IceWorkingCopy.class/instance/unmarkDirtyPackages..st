private-monticello
unmarkDirtyPackages: aDiff
	
	self modifiedPackages do: [ :each |
		(aDiff includesPackageNamed: each name)
			ifFalse: [ each mcWorkingCopy modified: false ] ]