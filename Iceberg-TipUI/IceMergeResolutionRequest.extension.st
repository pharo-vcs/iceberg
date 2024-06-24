Extension { #name : 'IceMergeResolutionRequest' }

{ #category : '*Iceberg-TipUI' }
IceMergeResolutionRequest >> defaultAction [

	| window mergeMorph |
	mergeMorph := (IceTipMergeMorph forMerger: merge).

	mergeMorph
		fromDescription: merge sourceDescription;
		toDescription: merge targetDescription.

	window := mergeMorph newWindow
		title: 'Merge';
		yourself.

	window openModal.
	^ mergeMorph merged
]
