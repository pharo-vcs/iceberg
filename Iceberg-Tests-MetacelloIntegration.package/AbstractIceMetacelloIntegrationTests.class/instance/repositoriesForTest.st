tests
repositoriesForTest

	^ IceRepository registry select: [ :e | e name = self repositoryName ]