baseline
baseline: spec
	<baseline>
	
	spec for: #common do: [ 
		spec postLoadDoIt: #resetKMRepository.
		
		self tonel: spec.
		self libgit: spec.
		self commander: spec.
		
		spec
			baseline: 'Ring2' 
			with: [ spec repository: 'github://pavel-krivanek/Ring2:mergeDev/src' ].
		
		spec
			"iceberg"
			package: 'Iceberg';
			package: 'Iceberg-Plugin' with: [ spec requires: #('Iceberg' 'Iceberg-TipUI' 'Commander') ];
			package: 'Iceberg-Plugin-Metacello' with: [ spec requires: #('Iceberg-Plugin') ];
			package: 'Iceberg-Plugin-GitHub' with: [ spec requires: #('Iceberg-Plugin') ];
			package: 'Iceberg-Plugin-Pharo' with: [ spec requires: #('Iceberg-Plugin') ];
			package: 'Iceberg-Metacello-Integration' with: [ spec requires: #('Iceberg')];
			package: 'Iceberg-UI' with: [ spec requires: #('Iceberg') ];
			package: 'Iceberg-TipUI' with: [ spec requires: #('Iceberg' 'Iceberg-UI' 'Commander') ];
			package: 'Iceberg-Memory' with: [ spec requires: #('Iceberg') ];
			package: 'Iceberg-Tests' with: [ spec requires: #('Iceberg' 'Iceberg-GitCommand' 'Iceberg-Memory' 'Ring2') ];
			package: 'Iceberg-UI-Tests' with: [ spec requires: #('Iceberg-UI' 'Iceberg-Tests')];
			"libgit"
			package: 'Iceberg-Libgit' with: [ spec requires: #('Iceberg' 'LibGit') ];
			package: 'Iceberg-Libgit-Filetree' with: [ spec requires: #('Iceberg' 'Iceberg-Libgit') ];
			package: 'Iceberg-Libgit-Tonel' with: [ spec requires: #('Iceberg' 'Iceberg-Libgit' 'Tonel') ];
			"for testing"
			for: #MacOS do: [ 
				self osSubprocess: spec.
				spec package: 'Iceberg-GitCommand' with: [ spec requires: #('OSSubprocess') ] ];
			for: #Unix do: [ 
				self osSubprocess: spec.
				spec package: 'Iceberg-GitCommand' with: [ spec requires: #('OSSubprocess' ) ] ];
			for: #Windows do: [ 
				self processWrapper: spec.
				spec package: 'Iceberg-GitCommand' with: [ spec requires: #('ProcessWrapper') ] ];
			"groups"
			group: 'default' with: #(
				minimal 
				'Iceberg-Metacello-Integration' 
				'Iceberg-UI' 
				'Iceberg-TipUI'
				'Iceberg-Plugin' 
				'Iceberg-Plugin-GitHub');
			group: 'minimal' with: #(
				'Iceberg'
				'Iceberg-Libgit' 
				'Iceberg-Libgit-Tonel'
				'Iceberg-Libgit-Filetree');
			group: 'allTests' with: #(
				'Iceberg-Tests' 
				'LibGit-Tests' 
				'Iceberg-UI-Tests' );
			group: 'development' with: #(default allTests) ].

	spec for: #'pharo6.x' do: [	
		self spec70: spec.
		spec
			package: 'Iceberg-Pharo6';
			package: 'Iceberg-UI' with: [ spec requires: #('Spec70Compatibility' 'Iceberg-Pharo6') ] ]