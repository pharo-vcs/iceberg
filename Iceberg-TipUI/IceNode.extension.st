Extension { #name : 'IceNode' }

{ #category : '*Iceberg-TipUI' }
IceNode >> inspectorItems: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  beResizable;
		  items: self children;
		  addColumn: (SpStringTableColumn new
				   title: 'Key';
				   width: 200;
				   evaluated: [ :each | each key asString ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Value';
				   width: 400;
				   evaluated: [ :each | each value asString ];
				   yourself);
		  yourself
]
