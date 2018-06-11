accessing
bootstrap
	| metacelloRegistrationEntry |
	metacelloRegistrationEntry := MetacelloProjectRegistration registry baselineRegistry at: 'BaselineOfIceberg'.
	self
		bootstrapWithCommitId: metacelloRegistrationEntry currentVersionString
		packageList: (metacelloRegistrationEntry baselineProjectSpec version packages collect: #name)