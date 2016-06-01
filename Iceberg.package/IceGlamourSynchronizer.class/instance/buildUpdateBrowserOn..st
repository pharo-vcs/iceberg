building
buildUpdateBrowserOn: browser.
	browser tabulator title: 'Update remote changes';
		row: [ :r | r column: #commits; column: #changes ];
		row: #diff.
