accessing
headerColumn: column
	column id ifNil: [ ^ nil ].
	^ SimpleButtonMorph new
		layoutPolicy: RowLayout new; 
		listDirection: #leftToRight; 
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: 5@0;
		layoutInset: 5@0;
		label: column id;
		target: self;
		actionSelector: #actionColumn:;
		arguments: {column};
		yourself