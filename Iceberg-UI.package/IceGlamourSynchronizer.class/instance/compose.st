building
compose
	(self custom: GLMStacker new) with: [ :browser |
		browser initialExtent: self initialExtent.
		browser updateOn: Announcement from: [ :repo | repo announcer weak ].

		browser aPane: #commit.
		browser transmit 
			transformed: #workingCopyDiff; 
			to: #commit;
			andShow: [ :a | a 
				title: 'Commit your changes'; 
				custom: IceCommitBrowser new ].

		browser aPane: #update.
		browser transmit 
			to: #update;
			andShow: [ :a | a 
				title: 'Update'; 
				custom: IceUpdateBrowser new ].

		browser aPane: #publish.
		browser transmit 
			to: #publish;
			andShow: [ :a | a 
				title: 'Push'; 
				custom: IcePublishBrowser new ].
	]
