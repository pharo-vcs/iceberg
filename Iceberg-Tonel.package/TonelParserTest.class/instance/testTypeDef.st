tests
testTypeDef
	self 
		assertParse: '
"
this is a test
"
Class { 
	#name: ''X'',
	#superclass: ''Y'',
	#category: ''Z'' 
}'
		rule: #typeDef
		equals: (MCClassDefinition
        name: 'X'
        superclassName: 'Y'
        traitComposition: '{}'
        classTraitComposition: '{}'
        category: 'Z'
        instVarNames: #()
        classVarNames: #()
        poolDictionaryNames: #()
        classInstVarNames: #()
        type: #normal
        comment: 'this is a test'
        commentStamp: nil)