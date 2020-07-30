Extension { #name : #CmdCommandActivator }

{ #category : #'*Iceberg-TipUI' }
CmdCommandActivator >> buildIceToolbarItem [
	| item |

	item := (SpToolbarButtonPresenter new
		label: self activationStrategy toolbarName;
		icon: self menuItemIcon;
		help: self activationStrategy help;
		badge: self command badge;
		action: [ self executeCommand ];
		yourself).
	
	^ item
]
