accessing
withoutLocalRepository
	types := self allTypes reject: #isLocalRepository.
	typeList widget dataSource elements: types.
	typeList widget refresh