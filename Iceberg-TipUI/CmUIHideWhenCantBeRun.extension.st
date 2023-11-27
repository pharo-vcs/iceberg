Extension { #name : 'CmUIHideWhenCantBeRun' }

{ #category : '*Iceberg-TipUI' }
CmUIHideWhenCantBeRun >> ifVisible: aCmSpecCommand do: aBlock [
	"Visible if #canBeExecuted"

	aCmSpecCommand canBeExecuted ifTrue: aBlock
]
