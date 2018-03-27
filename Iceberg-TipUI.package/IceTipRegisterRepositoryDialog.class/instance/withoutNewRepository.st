accessing
withoutNewRepository
	types := self allTypes reject: #isNewRepository.
	typeList widget dataSource elements: types.
	typeList widget refresh