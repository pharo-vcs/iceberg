specs
panelSpec
	<spec>
	
	^ SpecPanedLayout newVertical
		add: #commitList;
		add: #commitInfoTabs;
		yourself