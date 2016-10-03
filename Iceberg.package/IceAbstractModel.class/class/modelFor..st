accessing
modelFor: entity
	^ self models at: entity ifAbsentPut: [ self new entity: entity ]