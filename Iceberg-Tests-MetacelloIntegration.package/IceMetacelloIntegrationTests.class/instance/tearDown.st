running
tearDown

	(self repositoriesForTest, { conflictingRepository }) do: [ :each | each ifNotNil: [ :repo |
		repo unload.
		repo forget.
		repo location ifNotNil: #ensureDeleteAll.
		(IceMetacelloRepositoryAdapter for: repo) unregister ] ].		

	"Cleanup Metacello registry to avoid conflicts"		
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'PharoGitTest' ]
		ifFound: [ :registration | registration unregisterProject ].

	"Remove temporary repository just in case"
	'temp/test' asFileReference ensureDeleteAll.
	(IceLibgitRepository localRepositoriesLocation/'pharo-vcs'/self repositoryName) ensureDeleteAll.

	super tearDown.

	