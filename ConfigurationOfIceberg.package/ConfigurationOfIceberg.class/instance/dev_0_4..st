versions
dev_0_4: spec
	<version: 'dev-0.4'>
	
	spec for: #'common' do: [
  		spec
			baseline: 'Iceberg'
			with: [ 
				spec 
					repository: 'github://pharo-vcs/iceberg:dev-0.4';
					loads: 'development' ] ].
