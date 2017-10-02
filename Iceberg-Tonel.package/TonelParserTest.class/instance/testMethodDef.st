tests
testMethodDef
	self 
		assertParse: '
{ #category: ''accessing'' }
Object>>name [
	^ self printString
]'
		rule: #methodDef
		equals: (MCMethodDefinition
			className: #Object
			classIsMeta: false
			selector: #name
			category: 'accessing' 
			timeStamp: nil
			source: 'name
	^ self printString').
			
	self 
		assertParse: '
Object class>>name [ 
	^ self printString
]'
		rule: #methodDef
		equals: (MCMethodDefinition
			className: #Object
			classIsMeta: true
			selector: #name
			category: ''
			timeStamp: nil
			source: 'name 
	^ self printString').

	self 
		assertParse: '
TClass classSide >> template: aSystemCategoryName [ 
	"I really do not care"
]'
		rule: #methodDef
		equals: (MCMethodDefinition
			className: #TClass
			classIsMeta: true
			selector: #template:
			category: ''
			timeStamp: nil
			source: 'template: aSystemCategoryName 
	"I really do not care"').
