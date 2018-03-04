accessing
commitModels
	| commits |
	commits := OrderedCollection new.
	self entity commitsDo: [ :each | 
		commits add: (IceTipCommitModel for: each) beCached ].
	^ commits