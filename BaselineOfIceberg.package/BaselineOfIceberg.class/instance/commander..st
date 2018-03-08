baseline
commander: spec
	spec 
		baseline: 'Commander' 
		with: [ 
			spec 
				repository: 'github://dionisiydk/Commander:v0.5.x';
				loads: #('Core' 'AllActivators' 'Commander-SpecSupport') ]