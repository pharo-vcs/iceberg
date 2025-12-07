Extension { #name : 'MCMergeResolutionRequest' }

{ #category : '*Iceberg-TipUI' }
MCMergeResolutionRequest >> defaultAction [
	"Modally open a merge tool."

	^ (IceTipMergePresenter forMerger: merger) openModal isOk
]
