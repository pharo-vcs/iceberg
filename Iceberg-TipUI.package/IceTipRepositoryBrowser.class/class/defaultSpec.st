specs
defaultSpec
	<spec: #default>
	
	^ SpecBoxLayout newVertical
		add: #toolbar withConstraints: [ :c | c height: IceTipToolbar defaultHeight ];
		add: (SpecPanedLayout newHorizontal
			position: 30 percent; 
			add: #sidebarTree;
			add: #historyPanel withConstraints:[ :c | c spec: #panelSpec ];
			yourself);
		yourself