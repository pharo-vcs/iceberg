versions
master: spec
	<version: 'master'>
	
	spec for: #'common' do: [
  		spec
			baseline: 'Iceberg'
			with: [ spec repository: 'github://pharo-vcs/iceberg' ] ]