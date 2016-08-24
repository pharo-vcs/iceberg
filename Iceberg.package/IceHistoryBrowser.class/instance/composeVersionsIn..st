building
composeVersionsIn: composite
	composite fastTable
		title: 'Versions';
		display: #ownVersions;
		column: 'Package' evaluated: #package;
		column: '???' evaluated: #description
		