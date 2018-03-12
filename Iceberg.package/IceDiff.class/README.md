I am a diff between two Iceberg Commitish's. I calculate a diff by:

 - Asking to the repository the list of changed files/packages between the two versions. These are obtained, for example, by the Monticello dirty flags and the list of modified files provided by Git.
 - Using that list, the diff calculates two trees of IceDefinition. Those trees are represented as compositions of IceNode.
 - Then, the two trees are diff'd (see #diff:with:), and a tree of differences is obtained. This tree is also a composition of IceNodes, but contains IceOperation objects instead (additions, deletions and modifications).

The diff is calculated from left to right. This means that the resulting operations are the operations to apply on the right tree (the destination) to obtain the same tree as in the left (the source).

I am created by doing one of the following:

- IceDiff from: aVersion to: anotherVersion.

- IceDiff new
	sourceVersion: aVersion;
	targetVersion: anotherVersion;
	build;
	yourself