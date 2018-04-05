context menu
fillContextMenu: aMenu using: aCommandActivator
	super fillContextMenu: aMenu using: aCommandActivator.
	remote := aCommandActivator context item model entity