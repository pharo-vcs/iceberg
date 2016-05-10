specs
defaultSpec
	<spec: default>
	
	^ SpecLayout composed newColumn: 
		[ :col | col 
			add: #message; 
			add: #commitButton height: self toolbarHeight 
		]
