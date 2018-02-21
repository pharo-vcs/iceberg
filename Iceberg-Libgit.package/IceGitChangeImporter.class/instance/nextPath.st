building
nextPath

	^ IceGitChangeImporter new
		path: (RelativePath withAll: path segments allButFirst);
		diff: diff;
		version: version;
		yourself.