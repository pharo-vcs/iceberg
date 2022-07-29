Class {
	#name : #IceTipMergeModel,
	#superclass : #IceTipDiffPreviewModel,
	#instVars : [
		'mergeType',
		'mergeAction'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #actions }
IceTipMergeModel >> calculateDiff [

	^ self mergeAction
]

{ #category : #actions }
IceTipMergeModel >> executeMergeActionAndThen: aBlock [ 
	<noCache>
	
	(IceTipStandardAction newContext: self)
		repository: self repository;
		message: ('Merging {1} into {2}' format: { self targetName. self repositoryName });
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self merge ]
]

{ #category : #private }
IceTipMergeModel >> mergeAction [

	^ mergeAction ifNil: [
		mergeAction := IceMerge new
			repository: self repositoryModel entity;
			mergeCommit: commitish entity commit;
			yourself ]
]

{ #category : #accessing }
IceTipMergeModel >> mergeType: aMergeType [

	mergeType := aMergeType
]

{ #category : #actions }
IceTipMergeModel >> newMergeAction [

	mergeType newMergeAction: commitish
]

{ #category : #accessing }
IceTipMergeModel >> repositoryModel [
	^ commitish repositoryModel
]
