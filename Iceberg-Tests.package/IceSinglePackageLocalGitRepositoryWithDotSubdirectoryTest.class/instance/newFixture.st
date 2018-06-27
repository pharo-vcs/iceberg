running
newFixture
	^ IceSinglePackageFixture inGit
		subdirectory: '.';
		yourself