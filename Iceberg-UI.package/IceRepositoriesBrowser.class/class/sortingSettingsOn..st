settings
sortingSettingsOn: aBuilder
	<systemsettings>
	(aBuilder group: #'Packages sorting')
		parent: #Iceberg;
		description: 'Options to customize the sorting of the packages in Iceberg.';
		noOrdering;
		with: [ (aBuilder pickOne: #toDisplayFirst)
				order: 1;
				target: self;
				label: 'Packages to display first';
				description: 'The packages that will be shown at the top of the package list.';
				domainValues: self sortingStrategy class possibleValues.
			(aBuilder pickOne: #toDisplayLast)
				order: 2;
				target: self;
				label: 'Packages to display last';
				description: 'The packages that will be shown at the bottom of the package list.';
				domainValues: self sortingStrategy class possibleValues ]