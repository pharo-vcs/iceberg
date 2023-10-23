"
I indicate when a clas is reader for iceberg 
"
Trait {
	#name : 'TIceRepositoryReader',
	#category : 'Iceberg-Libgit-Writing',
	#package : 'Iceberg-Libgit',
	#tag : 'Writing'
}

{ #category : 'accessing' }
TIceRepositoryReader classSide >> id [
	^ self required
]

{ #category : 'testing' }
TIceRepositoryReader classSide >> isLegacyDefault [
	^ false
]
