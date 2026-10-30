"
I keep Iceberg's core independent from the UI: methods in its packages must not reference Morphic, UIManager or the Jobs package. I only see direct class references, not dependencies through other packages or messages such as #inform:.
"
Class {
	#name : 'IceCoreDependenciesTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'tests' }
IceCoreDependenciesTest >> corePackages [

	^ #( 'Iceberg' 'Iceberg-Libgit' 'Iceberg-Libgit-Tonel' 'Iceberg-Libgit-Filetree' 'Iceberg-Memory' ) collect: [ :each |
		  each asPackage ]
]

{ #category : 'tests' }
IceCoreDependenciesTest >> forbiddenReferencesIn: aMethod [

	^ aMethod literals
		  select: [ :each | each isVariableBinding and: [ each value isClass and: [ self isForbidden: each value ] ] ]
		  thenCollect: [ :each | aMethod name , ' -> ' , each key ]
]

{ #category : 'tests' }
IceCoreDependenciesTest >> isForbidden: aClass [

	| packageName |
	(aClass name = #UIManager or: [ aClass inheritsFrom: UIManager ]) ifTrue: [ ^ true ].
	packageName := aClass package name.
	^ (packageName beginsWith: 'Morphic') or: [ packageName = 'Jobs' ]
]

{ #category : 'tests' }
IceCoreDependenciesTest >> testCoreDoesNotReferenceUIOrJobs [

	| references |
	references := self corePackages flatCollect: [ :package |
		              package methods flatCollect: [ :method | self forbiddenReferencesIn: method ] ].
	self assert: references asArray equals: #(  )
]
