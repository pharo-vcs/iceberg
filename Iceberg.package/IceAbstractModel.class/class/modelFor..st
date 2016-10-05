accessing
modelFor: entity
	^ self models at: entity ifAbsentPut: [ self basicNew entity: entity; initialize; yourself ]