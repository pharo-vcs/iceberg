building
buildOn: browser
	browser row: #packages.
	
	browser transmit 
		to: #packages;
		andShow: [ :a | 
			a fastTable 
				title: 'Packages';
				display: [ self model packages ];
				column: 'Name' evaluated: #name ]