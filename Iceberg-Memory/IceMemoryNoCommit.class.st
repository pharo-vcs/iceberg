Class {
	#name : 'IceMemoryNoCommit',
	#superclass : 'IceNoCommit',
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'API-properties' }
IceMemoryNoCommit >> properties [
	^ IceRepositoryProperties
		fromDictionary: Dictionary new
		commitish: self
]
