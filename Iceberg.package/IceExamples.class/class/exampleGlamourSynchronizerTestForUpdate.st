examples - synchronize
exampleGlamourSynchronizerTestForUpdate
	| repository |
	repository := IceRepository origin: 'git@github.com:npasserini/pharo-git-test.git'.
	repository command: 'checkout HEAD^1'.
	IceGlamourSynchronizer synchronize: repository.
