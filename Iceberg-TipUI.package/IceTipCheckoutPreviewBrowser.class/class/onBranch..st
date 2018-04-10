instance-creation
onBranch: aBranch

	^ self on: (IceTipCheckoutModel new
		commitish: aBranch;
		yourself)