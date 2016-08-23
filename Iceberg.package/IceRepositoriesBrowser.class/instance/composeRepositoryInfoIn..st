building
composeRepositoryInfoIn: composite
	composite fastTable
		title: 'Repository info';
		display: [ :repository | self detailedInfoFrom: repository ];
		column: 'Name' evaluated: #key;
		column: 'Value' evaluated: #value
