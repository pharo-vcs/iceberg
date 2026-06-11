"
I am a command to be able to see the senders of a method in the snapshot browser
"
Class {
	#name : 'IceSBBrowseMethodSendersCommand',
	#superclass : 'IceSBBrowserAbstractMethodCommand',
	#category : 'Iceberg-TipUI-SnapshotBrowser',
	#package : 'Iceberg-TipUI-SnapshotBrowser'
}

{ #category : 'default' }
IceSBBrowseMethodSendersCommand class >> defaultName [

	^ 'Browse (in image) senders'
]

{ #category : 'executing' }
IceSBBrowseMethodSendersCommand >> execute [
	"Browse senders of the selected method"

	self selectedMethod browseSenders
]
