accessing
diffFromHead
	| commitModel |
	commitModel := IceTipCommitModel on: self entity commit.
	^ commitModel diffFromHead