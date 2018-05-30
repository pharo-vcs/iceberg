private factory
newInfoTab
	^ self newTab 
		label: 'Info';
		icon: #smallQuestion asIcon;
		closeable: false;
		yourself