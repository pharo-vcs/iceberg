accessing
withOnlyNewBranch
	types := self allTypes select: #isNewBranch.
	typeList widget dataSource elements: types.
	typeList widget refresh