instance creation
newCommitsDataSource
	| commitModels |
	commitModels := self pullRequest commits collect: [ :each | (IceTipCommitModel repositoryModel: self repositoryModel on: each) beCached ].
	^ IceTipDataSource new
		tool: self;
		elements: commitModels;
		yourself