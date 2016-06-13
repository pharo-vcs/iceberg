building
compose
	self tabulator with: [ :browser | 
		browser column: #repositories; column: #packages.
		
		browser transmit to: #repositories; andShow: [ :a | a fastTable 
			title: 'Repositories';
			column: 'Remote host' evaluated: [:repo | repo origin host, '/', repo origin owner ];
			column: 'Project name' evaluated: [: repo | repo origin projectName ];
			column: 'Current branch' evaluated: #branch
		].
	
		browser transmit from: #repositories; to: #packages; andShow: [ :a | a fastTable
			title: 'Packages';
			display: #allSavedPackages;
			column: 'Name' evaluated: #packageName;
			column: 'Is loaded' evaluated: [:pkg | self statusFor: pkg ]]
	]