context menu
fillMenu: aMenu title: aString command: aCommand activator: aCommandActivator baseline: aPackage
	| activator item |
	activator := aCommandActivator newForCommand: aCommand.
	item := aMenu 	
		add: aString
		target: activator
		selector: #executeCommand.
		
	aCommand setUpIconForMenuItem: item.
	aCommand description 
		ifNotNil: [ :d | item setBalloonText: d ]