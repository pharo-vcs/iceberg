auxiliar
saveNewVersion
	| latestVersionNumber testClass |
	latestVersionNumber := (repository latestVersion: packageName) versionNumber.

	testClass := Smalltalk at: #Test.
	testClass compile: ('nextVersion ^ {1}' format: {latestVersionNumber + 1}).

	repository savePackage: packageName withMessage: 'Automatic change done by unit tests'.
