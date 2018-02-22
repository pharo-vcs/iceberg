accessing
branchesByGroup
	| branches |
	branches := self branches.
	^ { 
	IceTipGroupModel 
		name: 'Branches' 
		icon: #branch asIcon
		elements: (branches select: [ :each | each entity isLocal ]).
	IceTipGroupModel name: 'Remotes' elements: (((branches 
		select: [ :each | each entity isRemote ]) 
		groupedBy: [ :each | each entity remoteName ]) 
		associations 
		collect: [ :each | IceTipGroupModel name: each key elements: each value ]) }