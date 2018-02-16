*Iceberg-Changes
addToPackageDiff: anIcePackageDiff leftSnapshot: leftSnapshot rightSnapshot: rightSnapshot
	
	| ownerDiff |
	ownerDiff := anIcePackageDiff
		ensureMethodOwnerNamed: self className
		isMeta: classIsMeta
		leftSnapshot: leftSnapshot
		rightSnapshot: rightSnapshot.
	^ ownerDiff ensureMethodNamed: selector