accessing
commitModels
	| commits |
	commits := OrderedCollection new.
	self entity commitsDo: [ :each | 
		commits add: (IceTipCommitModel 
			repositoryModel: self repositoryModel 
			on: each) 
			beCached ].
	^ commits