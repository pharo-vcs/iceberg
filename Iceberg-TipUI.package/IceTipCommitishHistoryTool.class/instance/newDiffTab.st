private factory
newDiffTab
	^ self newTab 
		label: 'Diff';
		icon: #diff asIcon;
		model: self newButton;
		closeable: false;
		yourself