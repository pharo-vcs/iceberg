tests
repositoriesForTest

	^ IceRepository registry select: [ :e | e name = 'pharo-git-test' ]