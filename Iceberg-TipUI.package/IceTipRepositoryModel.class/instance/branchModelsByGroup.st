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
		children: (((branches 
			select: [ :each | each entity isRemote ]) 
			groupedBy: [ :each | each entity remoteName ]) 
			associations 
			collect: [ :eachGroup | | remote remoteModel |
				remote := self entity remoteNamed: eachGroup key.
				remoteModel := (IceTipRemoteModel repositoryModel: self on: remote) beCached.
				(IceTipTreeRemote on: remoteModel)
					name: eachGroup key;
					children: (eachGroup value collect: [ :each | IceTipTreeBranch on: each ]);
					yourself ]);
		yourself }