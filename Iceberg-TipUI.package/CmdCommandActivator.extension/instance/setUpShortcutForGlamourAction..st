*Iceberg-TipUI
setUpShortcutForGlamourAction: anAction
	CmdShortcutCommandActivation 
		activeInstancesFor: command class 
		inContext: context
		do: [ :shortcut | anAction shortcut: shortcut keyCombination key ]	