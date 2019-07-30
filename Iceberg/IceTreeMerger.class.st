Class {
	#name : #IceTreeMerger,
	#superclass : #Object,
	#category : #'Iceberg-Changes'
}

{ #category : #building }
IceTreeMerger >> merge: changeTree into: currentTree [

	^ changeTree collectWithPath: [ :operation :path | 
			currentTree 
				resolve: path 
				ifPresent: [ :currentOperation | operation mergeWithOperation: currentOperation ] 
				ifAbsent: [ IceNonConflictingOperation operation: operation] ]
]
