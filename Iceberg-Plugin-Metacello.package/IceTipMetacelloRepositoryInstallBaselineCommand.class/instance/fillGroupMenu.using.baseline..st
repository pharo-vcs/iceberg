context menu
fillGroupMenu: aMenu using: aCommandActivator baseline: aPackage
	| concreteCommand |
	
	concreteCommand := self newBaselineGroupCommand: aPackage.
	self 
		fillMenu: aMenu
		title:  ('Install baseline of {1}...' format: { self nameOfBaseline: aPackage })
		command: concreteCommand 
		activator: aCommandActivator
		baseline: aPackage