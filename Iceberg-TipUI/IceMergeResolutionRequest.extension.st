Extension { #name : 'IceMergeResolutionRequest' }

{ #category : '*Iceberg-TipUI' }
IceMergeResolutionRequest >> defaultAction [

	^ (IceTipMergePresenter forMerger: merge) openModal isOk
]
