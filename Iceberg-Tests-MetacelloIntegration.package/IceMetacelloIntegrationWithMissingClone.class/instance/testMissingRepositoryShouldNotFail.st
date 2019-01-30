tests
testMissingRepositoryShouldNotFail

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.
			