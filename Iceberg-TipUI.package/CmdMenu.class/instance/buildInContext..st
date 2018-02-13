building
buildInContext: aToolContext

	activationStrategyClass 
		visibleInstancesInContext: aToolContext
		do: [ :activation | 
			self buildCommandItemInContext: aToolContext activatingBy: activation]