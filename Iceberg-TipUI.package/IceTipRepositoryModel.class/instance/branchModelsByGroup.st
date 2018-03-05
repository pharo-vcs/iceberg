accessing
branchModelsByGroup
	| branches |
	branches := self branchModels.
	^ { 
	IceTipGroupModel 
		name: 'Branches' 
		icon: #branch asIcon
		elements: (branches select: [ :each | each entity isLocal ]).
	IceTipGroupModel 
		name: 'Remotes' 
		icon: #remote asIcon
		elements: (((branches 
			select: [ :each | each entity isRemote ]) 
			groupedBy: [ :each | each entity remoteName ]) 
			associations 
			collect: [ :each | IceTipGroupModel name: each key elements: each value ]) }