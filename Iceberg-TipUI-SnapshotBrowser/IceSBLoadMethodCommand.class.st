"
I am a command to load a method from the Snapshot browser
"
Class {
	#name : 'IceSBLoadMethodCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBLoadMethodCommand class >> defaultName [

	^ 'Load method...'
]

{ #category : 'testing' }
IceSBLoadMethodCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedMethodDefinition isLoadable ]
]

{ #category : 'executing' }
IceSBLoadMethodCommand >> execute [
	"Load the selected method"

	self selectedMethodDefinition load
]
