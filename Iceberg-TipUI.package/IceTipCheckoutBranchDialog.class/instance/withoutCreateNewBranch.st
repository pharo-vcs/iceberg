accessing
withoutCreateNewBranch
	self flag: #todo. "This is horrible, think a better way"
	types := self allTypes reject: [ :each | each isKindOf: IceTipCheckoutNewBranchPanel ].
	typeList widget dataSource elements: types.
	typeList widget refresh