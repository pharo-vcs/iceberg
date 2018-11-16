tests
installBaseline

	Metacello new
		baseline: 'PharoGitTest';
		repository: (self repository , self class commitishToUse);
		load.