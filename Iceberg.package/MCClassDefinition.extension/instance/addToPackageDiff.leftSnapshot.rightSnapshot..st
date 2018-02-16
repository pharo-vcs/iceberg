*Iceberg-Changes
addToPackageDiff: anIcePackageDiff leftSnapshot: leftSnapshot rightSnapshot: rightSnapshot 
	
	^ anIcePackageDiff ensureClassNamed: self className isMeta: false