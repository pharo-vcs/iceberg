building
addRepositoryInfoTo: composite
	composite morph
		title: 'General';
		display: [ :model | self createInfoPanel: model detailedInfo ]