building
buildPushBrowserOn: browser.
	browser tabulator title: 'Publish';
		row: [ :r | r column: #commits; column: #changes ];
		row: #diff.
