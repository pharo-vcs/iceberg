accessing
branchModelsByGroup
	| branches |
	branches := self branchModels.
	^ { 
	IceTipTreeGroup 
		name: 'Branches' 
		icon: #branch asIcon
		children: (branches 
			select: [ :each | each entity isLocal ]
			thenCollect: [ :each | IceTipTreeElement for: each ]).
	IceTipTreeGroup 
		name: 'Remotes' 
		icon: #remote asIcon
		children: (((branches 
			select: [ :each | each entity isRemote ]) 
			groupedBy: [ :each | each entity remoteName ]) 
			associations 
			collect: [ :eachGroup | 
				IceTipTreeGroup 
					name: eachGroup key 
					children: (eachGroup value collect: [ :each |
						IceTipTreeElement for: each ]) ]) }