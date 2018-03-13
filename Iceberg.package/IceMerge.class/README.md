I implement the merge between two versions. I calculate the diff tree of each version and then calculate a merge tree containing the operations that should be applied to the right target tree to arrive to the left tree.

I am created by doing one of the following:

- IceMerge from: aVersion to: anotherVersion.

- IceMerge new
	sourceVersion: aVersion;
	targetVersion: anotherVersion;
	build;
	yourself