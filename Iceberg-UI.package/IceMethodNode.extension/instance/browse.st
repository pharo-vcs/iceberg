*Iceberg-UI
browse
	
	| owner |
	owner := Smalltalk globals at: self definition className.
	self definition classIsMeta ifTrue: [ owner := owner classSide ].
	(owner >> name) browse