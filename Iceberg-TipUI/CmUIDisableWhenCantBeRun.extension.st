Extension { #name : 'CmUIDisableWhenCantBeRun' }

{ #category : '*Iceberg-TipUI' }
CmUIDisableWhenCantBeRun >> ifVisible: aCmSpecCommand do: aBlock [
	"Always visible"

	aBlock value
]
