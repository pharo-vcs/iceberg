context menu
fillDefaultMenu: aMenu using: aCommandActivator baseline: aPackage
	| concreteCommand |
	
	concreteCommand := self newBaselineDefaultCommand: aPackage.
	self 
		fillMenu: aMenu
		title: ('Install baseline of {1} (default)' format: { self nameOfBaseline: aPackage })
		command: concreteCommand 
		activator: aCommandActivator
		baseline: aPackage