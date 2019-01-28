specs
defaultSpec
	<spec: #default>
	
	^ SpecPanedLayout newVertical
		add: #commitList;
		add: #commitPanel;
		yourself