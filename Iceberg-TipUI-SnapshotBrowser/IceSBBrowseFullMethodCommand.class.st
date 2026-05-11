"
I am a command to browse a method from the snapshot browser.
"
Class {
	#name : 'IceSBBrowseFullMethodCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseFullMethodCommand class >> defaultName [

	^ 'Browse (in image) full'
]

{ #category : 'testing' }
IceSBBrowseFullMethodCommand >> canBeExecuted [ 

	^   self selectedClassIsLoaded and: [ self selectedMethodDefinition isAlreadyDefined ]
]

{ #category : 'executing' }
IceSBBrowseFullMethodCommand >> execute [
	"Browse the selected method"

	self selectedMethod browse
]
