context menu
fillContextMenu: aMenu using: aCommandActivator

	| concreteScopeCommand switchActivator subMenu |

	subMenu := MenuMorph new.
	self repository remotes do: [ :each |  
		concreteScopeCommand := self copy remote: each; yourself.
		switchActivator := aCommandActivator newForCommand: concreteScopeCommand.
		subMenu add: switchActivator menuItemName target: switchActivator selector: #executeCommand		
	].
	
	aMenu add: self defaultMenuItemName subMenu: subMenu.