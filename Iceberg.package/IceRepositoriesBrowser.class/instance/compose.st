building
compose
	self tabulator with: [ :browser | 
		browser column: #repositories; column: #packages.
		
		browser transmit to: #repositories; andShow: [ :a | a fastTable 
			title: 'Repositories';
			column: 'Remote host' evaluated: [:repo | repo origin host, '/', repo origin owner ];
			column: 'Project name' evaluated: [: repo | repo origin projectName ];
			column: 'Current branch' evaluated: #branch;
			addAction: (GLMGenericAction new
				action: [ :presentation | self class createRepository ifNotNil: [ presentation update ]];
				icon: GLMUIThemeExtraIcons glamorousAdd;
				shortcut: $a;
				title: 'Add repository'; showTitle);
			addAction: (GLMGenericAction new
				action: [ :table | IceGlamourSynchronizer synchronize: table selection ];
				icon: GLMUIThemeExtraIcons glamorousBrowse;
				shortcut: $s;
				title: 'Synchronize with repository'; showTitle);
			selectionAct: [:presentation :repo | 
					self class switchBranchOf: presentation selection.
					presentation update 
				] on: $b entitled: 'Switch branch'
		].
	
		browser transmit from: #repositories; to: #packages; andShow: [ :a | a fastTable
			title: 'Packages';
			display: #allSavedPackages;
			column: 'Name' evaluated: #packageName;
			column: 'Status' evaluated: [:pkg | self statusFor: pkg ]]
	]