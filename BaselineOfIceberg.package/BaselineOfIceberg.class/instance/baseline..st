baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		configuration: 'OSSubprocess' with: [ spec
			versionString: #stable;
			repository: 'github://marianopeck/OSSubprocess/repository' ];
		configuration: 'ProcessWrapper' with: [ spec
			versionString: #stable;
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main' ];

		baseline: 'FileTree' with: [ spec
			repository: 'github://npasserini/filetree:pharo6.0_dev/repository';
			loads: 'Git' ];
		baseline: 'LibGit' with: [ spec 
			repository: 'github://npasserini/libgit2-pharo-bindings:development';
  			loads: 'default' ];
		project: 'LibGit-Tests'
          copyFrom: 'LibGit'
          with: [ spec loads: #('tests') ];

		package: 'Iceberg';
		package: 'Iceberg-GitCommand';
		package: 'Iceberg-UI' with: [ spec requires: #(Iceberg) ];
		package: 'Iceberg-Tests' with: [ spec requires: #(Iceberg 'Iceberg-GitCommand') ];
		package: 'Iceberg-GitFileTree' with: [ spec requires: #(Iceberg FileTree) ];
		package: 'Iceberg-Libgit' with: [ spec requires: #(Iceberg LibGit) ];

		for: #MacOS do: [ spec
			package: 'Iceberg-GitCommand'
			with: [ spec requires: #('OSSubprocess') ] ];
		for: #Unix do: [ spec
			package: 'Iceberg-GitCommand'
			with: [ spec requires: #('OSSubprocess' ) ] ];
		for: #Windows do: [ spec
			package: 'Iceberg-GitCommand'
			with: [ spec requires: #('ProcessWrapper') ] ];

		group: 'minimal' with: #(Iceberg 'Iceberg-Libgit');
		group: 'default' with: #(minimal 'Iceberg-UI');
		group: 'allTests' with: #('Iceberg-Tests' 'Libgit-Tests''Iceberg-GitFileTree-Tests' 'Iceberg-UI-Tests' );
		group: 'development' with: #(default 'Iceberg-GitFileTree' allTests)
	]