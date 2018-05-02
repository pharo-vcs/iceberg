accessing
withTypes: aCollection
	types := aCollection.
	typeList widget dataSource elements: types.
	typeList widget refresh