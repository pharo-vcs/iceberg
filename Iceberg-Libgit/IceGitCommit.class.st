Class {
	#name : #IceGitCommit,
	#superclass : #IceCommit,
	#instVars : [
		'id',
		'author',
		'datetime',
		'ancestorIds',
		'comment',
		'packageNamesCache'
	],
	#category : #'Iceberg-Libgit-Core'
}

{ #category : #comparing }
IceGitCommit >> = aGitCommit [

	(aGitCommit isKindOf: self species)
		ifFalse: [ ^ false ].
	^ self id = aGitCommit id
]

{ #category : #accessing }
IceGitCommit >> ancestorIds [

	^ ancestorIds
]

{ #category : #accessing }
IceGitCommit >> ancestorIds: aCollection [ 
	ancestorIds := aCollection
]

{ #category : #accessing }
IceGitCommit >> ancestors [
	
	^ ancestorIds collect: [ :each | repository lookupCommit: each ]
]

{ #category : #accessing }
IceGitCommit >> author [
	^ author
]

{ #category : #accessing }
IceGitCommit >> author: aString [ 
	author := aString
]

{ #category : #'API-changes' }
IceGitCommit >> changesFromCommit: anIceGitCommit [ 
	|  files |
	files := self repository changedFilesBetween: anIceGitCommit and: self.
	^ files collect: [ :each | IceGitChange on: each ]
]

{ #category : #accessing }
IceGitCommit >> comment [
	^ comment
]

{ #category : #accessing }
IceGitCommit >> comment: aString [ 
	comment := aString
]

{ #category : #ancestry }
IceGitCommit >> commonAncestorWithCommit: anIceGitCommit [
	
	repository handleLibgitError: [ | mergeBaseId |
		mergeBaseId := [ (self repositoryHandle
			mergeBaseBetween: (LGitId fromHexString: self id)
			and: (LGitId fromHexString: anIceGitCommit id)) hexString ]
			on: LGit_GIT_ENOTFOUND
			do: [ nil ].
		^ mergeBaseId ifNotNil: [ self repository lookupCommit: mergeBaseId ] ]
]

{ #category : #'API-tags' }
IceGitCommit >> createTag: aString [ 

	self repository handleLibgitError: [ 
		self repositoryHandle
			createTag: aString
			targetId: self libgitCommit id
			force: false.
		^ IceTag
			named: aString
			inRepository: self repository ]
]

{ #category : #accessing }
IceGitCommit >> datetime [
	^ datetime
]

{ #category : #accessing }
IceGitCommit >> datetime: aDateAndTime [ 
	datetime := aDateAndTime
]

{ #category : #'file-access' }
IceGitCommit >> entryByPath: aString [ 
	
	repository handleLibgitError: [ ^ (LGitCommit of: self repositoryHandle fromHexString: self id) entryByPath: aString ]
]

{ #category : #accessing }
IceGitCommit >> fetchPackageNames [

	| writerClass dir |
	writerClass := self writerClass.
	dir := self fileSystem resolve: (self project sourceDirectory).
		
	dir exists ifFalse: [ ^ #() ].
	
	^ dir children
		select: [ :each | writerClass isValidPackage: each ]
		thenCollect: [ :each | writerClass packageNameFromDirectory: each ]
]

{ #category : #'file-access' }
IceGitCommit >> fileSystem [
	
	^ (FileSystem onGitCommit: self libgitCommit) root
]

{ #category : #accessing }
IceGitCommit >> gitRef [
	
	^ self id
]

{ #category : #testing }
IceGitCommit >> hasMultipleAncestors [
	| ancestors |
	"using ancestorsIds because ancestors will instantiate parents and is slower"
	ancestors := self ancestorIds.
	^ ancestors notNil 
		and: [ ancestors size > 1 ]
]

{ #category : #comparing }
IceGitCommit >> hash [

	^ self id hash
]

{ #category : #accessing }
IceGitCommit >> id [
	^ id
]

{ #category : #accessing }
IceGitCommit >> id: aString [ 
	id := aString
]

{ #category : #private }
IceGitCommit >> libgitCommit [
	
	repository handleLibgitError: [ ^ LGitCommit of: self repositoryHandle fromHexString: self id ]
]

{ #category : #accessing }
IceGitCommit >> packageNames [
	
	^ self repository commitsInPackageCache
		at: self
		ifAbsentPut: [ self fetchPackageNames ]
]

{ #category : #'API-project' }
IceGitCommit >> project [

	self flag: #todo. "This is a quick fix for issue https://github.com/pharo-vcs/iceberg/issues/1002 and this should probably be improved to also cover issue https://github.com/pharo-vcs/iceberg/issues/949
	
	The idea is that if Iceberg contains a project at a certain commit and is associated to a local repository without the commit (because the image comes from a CI for example and the local repository is not in synch), we try to fetch the repository because the commit might be in the remote. This should cover most of the cases but might still fail if, for example, the local repository has different remotes than the one used where the repository was added to the image.
	
	This is a quick fix of the issue for Pharo 7 release."

	^ [ IceProjectReader readProjectFrom: self ] on: NotFound do: [ self repository fetch. IceProjectReader readProjectFrom: self ]
]

{ #category : #'API-properties' }
IceGitCommit >> readerClass [
	
	^ self properties readerClass
]

{ #category : #accessing }
IceGitCommit >> repositoryHandle [
	
	<repositoryHandleAccessor>
	^ repository repositoryHandle
]

{ #category : #'API-packages' }
IceGitCommit >> resetPackageCache [
	
	packageNamesCache := nil.
]

{ #category : #TOMOVE }
IceGitCommit >> snapshotFor: package [ 
	^ [ (self repository mcVersionFor: (self versionFor: package)) snapshot ]
		on: IceVersionDoesNotExist 
		do: [ :e | MCSnapshot empty ]
]

{ #category : #accessing }
IceGitCommit >> timeStamp [
	^ self datetime
]

{ #category : #'API-properties' }
IceGitCommit >> writerClass [

	^ self properties writerClass
]
