Class {
	#name : 'IceTipMergeModel',
	#superclass : 'IceTipDiffPreviewModel',
	#instVars : [
		'mergeType',
		'mergeAction'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'actions' }
IceTipMergeModel >> calculateDiff [

	^ self mergeAction
]

{ #category : 'private' }
IceTipMergeModel >> mergeAction [

	^ mergeAction ifNil: [
		mergeAction := IceMerge new
			repository: self repositoryModel entity;
			mergeCommit: commitish entity commit;
			yourself ]
]

{ #category : 'accessing' }
IceTipMergeModel >> mergeType: aMergeType [

	mergeType := aMergeType
]

{ #category : 'actions' }
IceTipMergeModel >> newExecuteMergeAction [ 
	
	^ IceTipStandardAction new
		repository: self repository;
		message: ('Merging {1} into {2}' format: { self targetName. self repositoryName });
		onSuccessRepositoryModified;
		action: [ :aContext | self newMergeAction executeWithContext: aContext ];
		yourself
]

{ #category : 'actions' }
IceTipMergeModel >> newMergeAction [

	^ mergeType newMergeAction: commitish
]

{ #category : 'accessing' }
IceTipMergeModel >> repositoryModel [
	^ commitish repositoryModel
]
