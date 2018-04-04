private
installBaseline: icePackage groups: anArray
	| packageDir baselineName policy |

	policy := nil.	
	packageDir := icePackage location parent fullName.
	baselineName := icePackage name allButFirst: self class baselinePrefix size.
	Metacello new
		repository: 'gitlocal://', packageDir;
		baseline: baselineName;
		onUpgrade: [ :e | 
			"this is kind of a hacky way to remember the option choosen in the context 
			 of the execution of this method."
			policy ifNil: [ policy := self chooseUpgradePolicyFor: e ].
			policy ifNotNil: [ e perform: policy ] ];
		load: anArray