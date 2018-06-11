*Iceberg-TipUI
browse
	
	| owner |
	owner := Smalltalk globals at: self className.
	self classIsMeta ifTrue: [ owner := owner classSide ].
	(owner >> name) browse