context menu
fillGroupMenu: aMenu using: aCommandActivator baseline: baselinePackage
	| concreteCommand activator |
	
	concreteCommand := self newBaselineGroupCommand: baselinePackage.
	activator := aCommandActivator newForCommand: concreteCommand.
	aMenu 	
		add: ('Install baseline of {1}...' format: { self nameOfBaseline: baselinePackage })
		target: activator 
		selector: #executeCommand