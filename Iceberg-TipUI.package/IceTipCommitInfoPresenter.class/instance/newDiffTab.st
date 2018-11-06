private factory
newDiffTab
	^ self newTab 
		label: 'Diff';
		icon: (self iconNamed: #diff);
		closeable: false;
		yourself