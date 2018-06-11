accessing
repositoryModelsByGroup
	| branches tags |
	branches := self allBranchModels.
	tags := self tagModels.
	^ { 
	"Branches group"
	(IceTipTreeRepositoryGroup on: self)
		name: 'Branches';
		icon: (self iconNamed: #branch);
		children: (branches
			select: [ :each | each entity isLocal ]
			thenCollect: [ :each | IceTipTreeBranch on: each ]);
		yourself.
	"Tags group"
	(IceTipTreeRepositoryGroup on: self)
		name: 'Tags';
		icon: (self iconNamed: #glamorousBookmark);
		children: (tags collect: [ :each | IceTipTreeTag on: each ]);
		yourself.
	"Remotes group"
	(IceTipTreeRepositoryGroup on: self)
		name: 'Remotes';
		icon: (self iconNamed: #remote);
		children: (self entity remotes collect: [ :eachRemote | | remoteModel |
			remoteModel := (IceTipRemoteModel repositoryModel: self on: eachRemote) beCached.
			(IceTipTreeRemote on: remoteModel)
				name: remoteModel name;
				children: (branches 
					select: [ :each | 
						each entity isRemote 
						and: [ each entity remoteName = eachRemote name ] ]
					thenCollect: [ :each | IceTipTreeBranch on: each ]);
				yourself	]);
		yourself.
	}