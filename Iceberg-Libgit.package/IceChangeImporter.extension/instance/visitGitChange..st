*Iceberg-Libgit
visitGitChange: anIceGitChange 

	| importer |
	importer := IceGitChangeImporter new
		path: anIceGitChange path;
		diff: diff;
		version: version;
		yourself.
	importer importOn: parentNode.