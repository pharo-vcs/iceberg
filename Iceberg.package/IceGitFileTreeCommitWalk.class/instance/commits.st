walking
commits
	| commits |
	commits := OrderedCollection new.
	self rawResultsDo: [ :result | commits add: (self commitFrom: result) ].
	^ commits