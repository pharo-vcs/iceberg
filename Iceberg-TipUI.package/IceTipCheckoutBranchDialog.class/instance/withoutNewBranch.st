accessing
withoutNewBranch
	types := self allTypes reject: #isNewBranch.
	typeList widget dataSource elements: types.
	typeList widget refresh