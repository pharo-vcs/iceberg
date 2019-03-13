tests
testObtainCommonCategoryFrom
	| action categories |
	
	action := IceConvertFormatAction new.
	categories := #('Seaside-Tests-Component-Stubs' 'Seaside-Tests-Component-Base').
	
	self
		assert: (action obtainCommonCategory: 'Seaside-Tests-Component-Stubs' from: categories)
		equals: 'Seaside-Tests-Component'.
	self
		assert: (action obtainCommonCategory: 'Seaside-Tests' from: categories)
		equals: 'Seaside-Tests'.
	self
		assert: (action obtainCommonCategory: 'NONE' from: categories)
		equals: ''