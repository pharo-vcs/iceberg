tests
installBaseline

	Metacello new
		baseline: 'PharoGitTest';
		repository: (self repository , CommitishToUse);
		load.