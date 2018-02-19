private factory
newDiffTab
	^ self newTab 
		label: 'Diff';
		icon: #diff asIcon;
		closeable: false;
		yourself