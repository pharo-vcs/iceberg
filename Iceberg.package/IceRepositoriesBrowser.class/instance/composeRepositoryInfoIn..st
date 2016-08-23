building
composeRepositoryInfoIn: composite
	composite fastTable
		title: 'Repository';
		display: [ :repository | self detailedInfoFrom: repository ];
		column: 'Name' evaluated: #key;
		column: 'Value' evaluated: #value
