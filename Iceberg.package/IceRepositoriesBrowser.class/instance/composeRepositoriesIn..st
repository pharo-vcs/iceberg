building
composeRepositoriesIn: composite
	composite fastTable 
		title: 'Repositories #5';
		column: 'Origin' evaluated: [:repo | repo origin url ] width: 320;
		column: 'Current branch' evaluated: #branchName;
		updateOn: IceRepositoryRegistryModified from: [ Iceberg announcer ];
		addAction: self createRepositoryAction;
		addAction: self createLocalRepositoryAction;
		selectionAct: self switchBranch on: $b entitled: 'Switch branch...';
		selectionAct: self forgetRepository on: $x entitled: 'Forget repository...';
		addSelectionAction: self synchronizeRepositoryAction;
		addSelectionAction: self pushAction;
		selectionAct: self refreshRepository on: $r entitled: 'Refresh repository';
		onChangeOfPort: #strongSelection act: [ :table | self synchronize: table selection ]
