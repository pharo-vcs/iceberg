private
basicInstallBaseline: icePackage groups: anArray
	| packageDir baselineName sourceDirectory|

	sourceDirectory := icePackage repository project sourceDirectory.
	sourceDirectory ifEmpty: [ sourceDirectory := '.'].

	packageDir := (icePackage repository location / sourceDirectory) fullName.
	baselineName := icePackage name allButFirst: self class baselinePrefix size.
	Metacello new
		repository: 'gitlocal://', packageDir;
		baseline: baselineName;
		onUpgrade: [ :e | | policy |
			policy := self chooseUpgradePolicyFor: e.
			policy ifNotNil: [ e perform: policy ] ];
		onConflict: [ :e | | policy |
			policy := self chooseConflictPolicyFor: e.
			policy ifNotNil: [ e perform: policy ] ];
		load: anArray