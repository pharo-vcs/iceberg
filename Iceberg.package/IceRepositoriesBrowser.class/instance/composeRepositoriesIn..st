building
composeRepositoriesIn: composite
	composite fastTable 
		title: 'Repositories';
		column: 'Origin' evaluated: [:repo | repo origin url ] width: 320;
		column: 'Current branch' evaluated: #branchName;
		addAction: self createRepositoryAction;
		addAction: self synchronizeRepositoryAction;
		selectionAct: self switchBranch on: $b entitled: 'Switch branch';
		selectionAct: self forgetRepository on: $x entitled: 'Forget repository';
		addSelectionAction: self pushAction;
		selectionAct: self refreshRepository on: $r entitled: 'Refresh repository';
		onChangeOfPort: #strongSelection act: [ :table | IceGlamourSynchronizer synchronize: table selection ]
