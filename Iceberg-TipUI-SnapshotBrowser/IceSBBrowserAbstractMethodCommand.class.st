"
I am an abstract class to manage the snapshot browser commands about methods.
"
Class {
	#name : 'IceSBBrowserAbstractMethodCommand',
	#superclass : 'IceSnapshotBrowserCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'testing' }
IceSBBrowserAbstractMethodCommand >> canBeExecuted [ 
	"we cannot load a method of a class not loaded"
	
	^ self selectedMethodDefinition actualClass isNotNil
]

{ #category : 'accessing - selection' }
IceSBBrowserAbstractMethodCommand >> selectedMethod [
	"Answer the actual selected <CompiledMethod>"
	
	^ self selectedMethodDefinition method
]

{ #category : 'accessing - selection' }
IceSBBrowserAbstractMethodCommand >> selectedMethodDefinition [
	"Answer the currently selected <MCMethodDefinition>"

	^ context selectedMethod
]
