tests
testMethodDef
	self 
		assertParse: '
{ #protocols: [ ''accessing'' ] }
Object>>name [
	^ self printString
]'
		rule: #methodDef
		equals: {  
			nil.
			{ #protocols -> #('accessing') } asDictionary.
			nil.
			#('Object' 'name').
			nil.
			Character tab asString, '^ self printString'
			}.
			
	self 
		assertParse: '
Object>>name [
	^ self printString
]'
		rule: #methodDef
		equals: {  
			nil.
			nil.
			nil.
			#('Object' 'name').
			nil.
			Character tab asString, '^ self printString'
			}