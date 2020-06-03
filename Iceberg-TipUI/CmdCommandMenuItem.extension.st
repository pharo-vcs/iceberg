Extension { #name : #CmdCommandMenuItem }

{ #category : #'*Iceberg-TipUI' }
CmdCommandMenuItem >> buildIceToolbarItem [
	^ activator buildIceToolbarItem
]

{ #category : #'*Iceberg-TipUI' }
CmdCommandMenuItem >> iceToolbarPosition [

	^ activator activationStrategy position
]
