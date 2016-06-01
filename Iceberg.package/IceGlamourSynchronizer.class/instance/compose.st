building
compose
	(self custom: GLMStacker new) with: [ :browser |
		browser aPane: #commit.
		browser transmit 
			transformed: #workingCopyDiff; 
			to: #commit;
			andShow: [ :a | a 
				title: 'Commit your changes'; 
				custom: IceGlamourCommitBrowser new ].
	]
