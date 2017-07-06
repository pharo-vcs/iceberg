accessing
hasNext
	^ result isNil or: [ self parseMorePages: (result headers at: 'Link' ifAbsent: [ nil ]) ]