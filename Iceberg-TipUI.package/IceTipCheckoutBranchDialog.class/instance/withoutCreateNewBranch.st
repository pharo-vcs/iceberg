accessing
withoutCreateNewBranch
	types := self allTypes reject: [ :each | each isKindOf: IceTipCheckoutNewBranchPanel ].
	typeList widget dataSource elements: types.
	typeList widget refresh