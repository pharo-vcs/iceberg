"
Description
--------------------

I am a simple Trait allowing to copy a commit ID to the clipboard without duplicating the code in Iceberg.
"
Trait {
	#name : 'TIceCopyCommitId',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'copying' }
TIceCopyCommitId >> copyCommitIDToClipboard [

	self copyToClipboardId: self commitId
]

{ #category : 'copying' }
TIceCopyCommitId >> copyToClipboardId: id [
	Clipboard clipboardText: id informing: ('Commitish ID copied to clipboard ({1})' format: {id})
]
