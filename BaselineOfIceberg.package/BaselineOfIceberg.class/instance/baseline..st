baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'FileTree' with: [ spec
			repository: 'github://npasserini/filetree:pharo6.0_dev/repository';
			loads: 'Git' ];
		baseline: 'LibGit' with: [ spec 
			repository: 'github://npasserini/LibGit:pharo50';
  			loads: 'development' ];
		package: 'Iceberg'
			with: [ spec requires: #(FileTree LibGit) ];
		package: 'Iceberg-Tests'
			with: [ spec requires: #(default) ];
		group: 'default'
			with: #(Iceberg);
		group: 'tests'
			with: #('Iceberg-Tests')
	]