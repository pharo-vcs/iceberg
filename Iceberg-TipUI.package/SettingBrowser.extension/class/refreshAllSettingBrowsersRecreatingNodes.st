*Iceberg-TipUI
refreshAllSettingBrowsersRecreatingNodes
	self allSubInstances do: [:sb | sb updateList. sb applyFilters].