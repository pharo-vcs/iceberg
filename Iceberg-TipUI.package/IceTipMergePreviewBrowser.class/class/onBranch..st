instance creation
onBranch: aBranch

	^ self on: (IceTipMergeModel new
		commitish: aBranch;
		yourself)