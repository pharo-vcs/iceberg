Extension { #name : 'IceRepository' }

{ #category : '*Iceberg-TipUI' }
IceRepository >> inspectorItems [
	<inspectorPresentationOrder: 0 title: 'Packages'>

	^ SpTablePresenter new
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
			evaluated: [ :each | each asString ];
			yourself);
		yourself.
]
