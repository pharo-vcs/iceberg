accessing
refresh
	| commitModels |
	commitModels := self model commitModels.
	commitList widget
		in: [ :this | this dataSource elements: commitModels ];
		refresh.
	commitInfoTabs selectedModel: (commitModels ifNotEmpty: #first ifEmpty: [ nil ])