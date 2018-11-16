class initialization
initializeSettings
	Smalltalk 
		at: #SystemSettingsPersistence 
		ifPresent: [ :class | | tree nodes | 
			tree := class default settingTree.
			nodes := tree deeplySelect: [ :node | node receiverPackage name beginsWith: 'Iceberg' ].
			class updateSettingNodes: nodes ]