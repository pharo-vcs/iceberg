private
updateHeadCommit
	| headCommit |
	headCommit := self newCommitWalk fromHead firstCommit.
	self frontend branch addCommit: headCommit.
	^ headCommit