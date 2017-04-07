accessing
packageActionsFor: icePackage
	^ (icePackage packageName beginsWith: self class baselinePrefix) 
		ifTrue: [ { self installBaselineAction } ]
		ifFalse: [ #() ]