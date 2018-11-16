running
newFixture

	^ IceSinglePackageFixture inGit
		subdirectory: 'src';
		yourself