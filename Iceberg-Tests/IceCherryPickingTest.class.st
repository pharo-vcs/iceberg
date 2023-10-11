Class {
	#name : 'IceCherryPickingTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Cherrypicking',
	#package : 'Iceberg-Tests',
	#tag : 'Cherrypicking'
}

{ #category : 'testing' }
IceCherryPickingTest class >> isAbstract [

	^ self name = #IceCherryPickingTest
]

{ #category : 'running' }
IceCherryPickingTest >> newFixture [

	^ IceBasicCherryPickingFixture inGit
]
