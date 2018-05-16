initialization
initializePresenter
	super initializePresenter.
	self location: (self repository location ifNil: [ IceRepository repositoriesLocation ]).
	self codeDirectory: self repository subdirectory.