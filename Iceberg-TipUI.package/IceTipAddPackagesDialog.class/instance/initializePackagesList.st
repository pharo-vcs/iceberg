initialization
initializePackagesList
	| dataSource |
	
	dataSource := self newPackagesListDataSource.
	packagesList widget
		addColumn: (IceTipTableColumn newAction: #name icon: [ :each | self iconNamed: #package ]);
		dataSource: dataSource;
		useFunction: IceTipLinkFilterFunction do: [ :function | 
			function 
				filterClass: IceTipPackageFilter;
				textField: self packageNameText ];
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTStrongSelectionChanged do: [ self accept ]