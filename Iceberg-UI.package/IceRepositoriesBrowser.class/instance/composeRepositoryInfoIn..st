building
composeRepositoryInfoIn: composite
	composite fastTable
		title: 'Repository info';
		display: #detailedInfo;
		column: 'Name' evaluated: #key;
		column: 'Value' evaluated: #value
