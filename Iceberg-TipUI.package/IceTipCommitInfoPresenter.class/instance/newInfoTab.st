private factory
newInfoTab
	^ self newTab 
		label: 'Info';
		icon: (self iconNamed: #smallQuestion);
		closeable: false;
		yourself