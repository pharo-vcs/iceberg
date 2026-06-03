"
I am a command to be able to browse the implementors of a method.
"
Class {
	#name : 'IceSBBrowseMethodImplementorsCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseMethodImplementorsCommand class >> defaultName [

	^ 'Browse implementors'
]

{ #category : 'testing' }
IceSBBrowseMethodImplementorsCommand >> canBeExecuted [ 

	^ super canBeExecuted and: [ self selectedClassIsLoaded ]
]

{ #category : 'executing' }
IceSBBrowseMethodImplementorsCommand >> execute [
	"Browse implementors of the selected method"

	self systemNavigation browseAllImplementorsOf: (context selectedMessageName ifNil: [ ^nil ])
]
