Class {
	#name : 'IceAbstractTestCase',
	#superclass : 'IceParameterizedTestCase',
	#instVars : [
		'fixture'
	],
	#category : 'Iceberg-Tests-Base',
	#package : 'Iceberg-Tests',
	#tag : 'Base'
}

{ #category : 'assertions' }
IceAbstractTestCase >> assertClassExists: aString [ 
	
	self assert: (self repository workingCopy environment ask includesClassNamed: aString)
]

{ #category : 'assertions' }
IceAbstractTestCase >> assertMethodExists: aMethodName inClass: aClassName [ 

	self assert: ((self repository workingCopy environment ask classNamed: aClassName) includesSelector: aMethodName)
		
]

{ #category : 'assertions' }
IceAbstractTestCase >> assertPackageExists: aString [ 
	
	self assert: (self repository workingCopy environment ask includesPackageNamed: aString)
]

{ #category : 'assertions' }
IceAbstractTestCase >> denyClassExists: aString [ 
	
	self deny: (self repository workingCopy environment ask includesClassNamed: aString)
]

{ #category : 'asserting' }
IceAbstractTestCase >> denyMethodExists: aMethodName inClass: aClassName [ 
	self deny: ((self repository workingCopy environment ask classNamed: aClassName) includesSelector: aMethodName)

]

{ #category : 'assertions' }
IceAbstractTestCase >> denyPackageExists: aString [ 
	
	self deny: (self repository workingCopy environment ask includesPackageNamed: aString)
]

{ #category : 'running' }
IceAbstractTestCase >> newFixture [

	self subclassResponsibility
]

{ #category : 'factory' }
IceAbstractTestCase >> newRemoteNamed: aString [ 
	
	^ fixture newRemoteNamed: aString
]

{ #category : 'accessing' }
IceAbstractTestCase >> packageName1 [
	
	^ fixture packageName1
]

{ #category : 'accessing' }
IceAbstractTestCase >> packageName2 [
	
	^ fixture packageName2
]

{ #category : 'accessing' }
IceAbstractTestCase >> remote [
	^ fixture remote
]

{ #category : 'accessing' }
IceAbstractTestCase >> remoteBranchName [
	
	^ fixture remoteBranchName
]

{ #category : 'accessing' }
IceAbstractTestCase >> remoteRepository [
	
	^ fixture remoteRepository
]

{ #category : 'accessing' }
IceAbstractTestCase >> repository [

	^ fixture repository
]

{ #category : 'running' }
IceAbstractTestCase >> setUp [
	super setUp.
	fixture := self newFixture.
	fixture setUp
]

{ #category : 'running' }
IceAbstractTestCase >> tearDown [

	fixture ifNotNil: [ fixture tearDown ].
	super tearDown.
]

{ #category : 'accessing' }
IceAbstractTestCase >> workingCopy [
	
	^ self repository workingCopy
]
