accessing
branchModelsByGroup
	| branches |
	branches := self branchModels.
	^ { 
	IceTipTreeGroupModel 
		name: 'Branches' 
		icon: #branch asIcon
		children: (branches 
			select: [ :each | each entity isLocal ]
			thenCollect: [ :each | IceTipTreeElementModel for: each ]).
	IceTipTreeGroupModel 
		name: 'Remotes' 
		icon: #remote asIcon
		children: (((branches 
			select: [ :each | each entity isRemote ]) 
			groupedBy: [ :each | each entity remoteName ]) 
			associations 
			collect: [ :eachGroup | 
				IceTipTreeGroupModel 
					name: eachGroup key 
					children: (eachGroup value collect: [ :each |
						IceTipTreeElementModel for: each ]) ]) }