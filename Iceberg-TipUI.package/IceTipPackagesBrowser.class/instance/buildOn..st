building
buildOn: browser
	browser row: #packages.
	
	browser transmit to: #packages; andShow: [ :a | 
		a fastTable 
			title: 'Packages'; 
			display: [ self model packages ];
			in: [ :this | self addPackageActionsOn: this ];
			column: 'Name' evaluated: #descriptionText;
			column: 'Status' evaluated: #status ]