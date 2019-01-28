specs
defaultSpec
	<spec: #default>
	
	^ SpecBoxLayout newVertical 
		add: #toolbar withConstraints: [ :c | c height: IceTipToolbar defaultHeight ];
		add: #remotePanel withConstraints: [ :c | c height: self inputTextHeight ];
		add: #commitsPanel withConstraints: [ :c | c spec: #panelSpec ];
		add: #actionPanel withConstraints: [ :c | c height: self iceActionPanelHeight ];
		yourself