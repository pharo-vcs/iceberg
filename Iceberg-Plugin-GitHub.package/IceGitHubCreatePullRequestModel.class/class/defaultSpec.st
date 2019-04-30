specs
defaultSpec 
	<spec>

	^ SpecGridLayout new
		add: #titleLabel at: 1@1; 	add: #titlePanel at: 2@1 		span: 2@1;
		add: #headLabel at: 1@2; 	add: #headForkList at: 2@2; 	add: #headBranchList at: 3@2;
		add: #baseLabel at: 1@3; 	add: #baseForkList at: 2@3; 	add: #baseBranchList at: 3@3;
		add: #bodyLabel at: 1@4; 	add: #bodyPanel at: 2@4 			span: 2@4;
		yourself