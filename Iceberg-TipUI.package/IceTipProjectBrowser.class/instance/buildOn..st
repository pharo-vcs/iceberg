building
buildOn: browser
	browser row: #projects.
	
	browser transmit to: #projects; andShow: [ :a |
		a fastList 
			title: 'Projects';
			display: [ self projects ];
			format: #descriptionText ]