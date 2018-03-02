private-monticello
unmarkDirtyPackages
	
	| diff |
	diff := self repository workingCopyDiff.
	
	dirtyPackages removeAll.
	diff packages do: [ :each | self markPackageDirty: each value definition ]