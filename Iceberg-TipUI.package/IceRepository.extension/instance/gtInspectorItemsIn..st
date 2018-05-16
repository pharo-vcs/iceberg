*Iceberg-TipUI
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite fastTable 
		title: 'Packages';
		display: [ self workingCopy packages ];
		column: 'Name' evaluated: [:each | each name ] width: 400;
		column: 'Status' evaluated: [:each | each asString ] width: 400