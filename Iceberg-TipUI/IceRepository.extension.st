Extension { #name : 'IceRepository' }

{ #category : '*Iceberg-TipUI' }
IceRepository >> inspectorItems: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Packages'>

	^ aBuilder newTable 
		addStyle: 'stList';
		beResizable;
		items: self workingCopy packages;
		addColumn: (SpStringTableColumn new
			title: 'Name';
			width: 400;
			evaluated: [ :each | each name ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Status';
			width: 400;
			evaluated: [ :each | each displayString ];
			yourself);
		yourself.
]
