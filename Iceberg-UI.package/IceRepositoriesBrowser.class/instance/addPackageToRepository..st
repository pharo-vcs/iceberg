actions
addPackageToRepository: repo
	| options descriptionBlock |
	
	descriptionBlock := [ :wc | 
		wc modified 
			ifTrue: ['* ', wc packageName]
			ifFalse: [ wc packageName ]].
	options := (MCWorkingCopy allManagers difference: repo workingCopies).

	(self class chooseFrom: options displaying: descriptionBlock) 
		ifNotNil: [ :workingCopy | 
			workingCopy modified: true.
			repo addPackageNamed: workingCopy packageName. ]