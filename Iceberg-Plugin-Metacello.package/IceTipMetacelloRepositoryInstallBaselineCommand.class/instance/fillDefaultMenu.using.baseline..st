context menu
fillDefaultMenu: aMenu using: aCommandActivator baseline: baselinePackage
	| concreteCommand activator |
	concreteCommand := self newBaselineDefaultCommand: baselinePackage.
	activator := aCommandActivator newForCommand: concreteCommand.
	aMenu 	
		add: ('Install baseline of {1} (default)' format: { self nameOfBaseline: baselinePackage })
		target: activator 
		selector: #executeCommand