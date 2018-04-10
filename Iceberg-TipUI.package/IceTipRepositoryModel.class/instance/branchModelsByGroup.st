accessing
branchModelsByGroup
	| branches |
	branches := self allBranchModels.
	^ { 
	"Branches group"
	(IceTipTreeRepositoryGroup on: self)
		name: 'Branches';
		icon: #branch asIcon;
		children: (branches
			select: [ :each | each entity isLocal ]
			thenCollect: [ :each | IceTipTreeBranch on: each ]);
		yourself.
	"Remotes group"
	(IceTipTreeRepositoryGroup on: self)
		name: 'Remotes';
		icon: #remote asIcon;
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