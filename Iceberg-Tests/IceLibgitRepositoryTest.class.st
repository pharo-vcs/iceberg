Class {
	#name : 'IceLibgitRepositoryTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'tests' }
IceLibgitRepositoryTest >> testLocalRepositoriesLocation [

	self assert: IceLibgitRepository localRepositoriesLocation exists
]

{ #category : 'tests' }
IceLibgitRepositoryTest >> testSharedRepositoriesLocation [

	self assert: IceLibgitRepository sharedRepositoriesLocation exists
]
