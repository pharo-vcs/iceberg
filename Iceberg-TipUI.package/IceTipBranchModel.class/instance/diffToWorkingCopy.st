accessing
diffToWorkingCopy
	| commitModel |
	commitModel := IceTipCommitModel on: self entity commit.
	^ commitModel diffToWorkingCopy