API-packages
addPackages: aCollection 
	
	aCollection keysDo: [ :each | self addPackageNamed: each ]