private factory
newEmptyTab
	^ self newTab 
		label: 'Info';
		icon: (self iconNamed: #smallQuestion);
		closeable: false;
		contents: '(No commit selected)' asMorph;
		yourself