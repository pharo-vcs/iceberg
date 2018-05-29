private factory
newEmptyTab
	^ self newTab 
		label: 'Info';
		icon: #smallQuestion asIcon;
		closeable: false;
		contents: '(No commit selected)' asMorph;
		yourself