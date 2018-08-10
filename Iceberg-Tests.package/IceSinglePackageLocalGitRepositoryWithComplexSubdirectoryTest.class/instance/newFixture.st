running
newFixture

	^ IceSinglePackageFixture inGit
		subdirectory: 'src/dev/somethingElse/complex-andWith-Dashes';
		yourself