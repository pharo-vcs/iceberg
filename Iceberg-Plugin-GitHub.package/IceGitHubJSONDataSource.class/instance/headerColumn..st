accessing
headerColumn: column
	column id ifNil: [ ^ nil ].

	^ SimpleButtonMorph new
		layoutPolicy: RowLayout new; 
		listDirection: #leftToRight; 
		wrapCentering: #center;
		cellInset: 5@0;
		layoutInset: 5@0;
		label: (self columnTitleFor: column);
		target: self;
		actionSelector: #actionColumn:;
		arguments: {column};
		yourself