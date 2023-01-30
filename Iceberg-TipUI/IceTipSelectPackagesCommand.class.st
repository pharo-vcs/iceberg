"
Provides common behavior to accesing the packages list presenters in its context.
"
Class {
	#name : #IceTipSelectPackagesCommand,
	#superclass : #IceTipPackageCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #executing }
IceTipSelectPackagesCommand >> packagesList [
	" Answer a <SpTablePresenter> including the receiver's packages "
	
	^ self context packagesList
]

{ #category : #executing }
IceTipSelectPackagesCommand >> packagesListSelectionColumn [
	" Answer a <SpCheckBoxTableColumn> to select packages in the receiver's context package list "

	| compositeCol |
	compositeCol := self packagesList columns.
	^ compositeCol anyOne columns select: [ : c | c isKindOf: SpCheckBoxTableColumn ]
]
