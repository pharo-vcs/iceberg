Class {
	#name : 'IceMemoryProject',
	#superclass : 'Object',
	#instVars : [
		'repository',
		'commitish'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'instance creation' }
IceMemoryProject class >> onRepository: anIceMemoryRepository commitish: aCommitish [

	^ self new
		repository: anIceMemoryRepository;
		commitish: aCommitish;
		yourself
]

{ #category : 'comparing' }
IceMemoryProject >> = aMemoryProject [

	^ aMemoryProject isMemoryProject
]

{ #category : 'accessing' }
IceMemoryProject >> commitish: aCommitish [
	
	commitish := aCommitish	
]

{ #category : 'testing' }
IceMemoryProject >> isDirty [
	^ repository workingCopy referenceCommit project ~= self
]

{ #category : 'testing' }
IceMemoryProject >> isInvalid [
	
	^ false
]

{ #category : 'testing' }
IceMemoryProject >> isMemoryProject [

	^ true
]

{ #category : 'testing' }
IceMemoryProject >> isUnbornProject [
	
	^ false
]

{ #category : 'API-projects' }
IceMemoryProject >> packageNames [
	
	^ commitish packageNames
]

{ #category : 'API-projects' }
IceMemoryProject >> packages [
	
	^ commitish packages
]

{ #category : 'API-packages' }
IceMemoryProject >> packagesFrom: anIceMemoryCommit [

	^ anIceMemoryCommit packages
]

{ #category : 'accessing' }
IceMemoryProject >> repository: anIceMemoryRepository [ 
	repository := anIceMemoryRepository
]
