specs
defaultSpec
	<spec: #default>
	
	^ SpecBoxLayout newVertical 
		add: #toolbar withConstraints: [ :c | c height: IceTipToolbar defaultHeight ];
		add: (SpecPanedLayout newVertical
			add: #commitList;
			add: #commitInfoTabs;
			yourself);
		yourself