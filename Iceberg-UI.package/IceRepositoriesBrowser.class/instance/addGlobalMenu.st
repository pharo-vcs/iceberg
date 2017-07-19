building
addGlobalMenu
	self
		act: [ 
			SettingBrowser new 
				changePackageSet: { (RPackageOrganizer default packageNamed: 'Iceberg') }; 
				open; 
				expandAll ] 
		icon: #configuration asIcon
		entitled: 'Global Settings'