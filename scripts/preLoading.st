"Shutdown Libgit"
LGitLibrary shutDown: true.

"Remove iceberg from system (so I can reload it)"
MetacelloPharoPlatform select.
#(
    'BaselineOfTonel'
    'BaselineOfLibGit'
    'BaselineOfIceberg'

    'MonticelloTonel-Core'
    'MonticelloTonel-FileSystem'
    'MonticelloTonel-Tests'

    'Iceberg'
    'Iceberg-GitCommand'
    'Iceberg-Libgit'
    'Iceberg-Libgit-Filetree'
    'Iceberg-Libgit-Tonel'
    'Iceberg-Memory'
    'Iceberg-Metacello-Integration'
    'Iceberg-Plugin'
    'Iceberg-Plugin-GitHub'
    'Iceberg-Plugin-Metacello'
    'Iceberg-Plugin-Pharo'
    'Iceberg-Tests'
    'Iceberg-TipUI'
    'Iceberg-UI'
    'Iceberg-UI-Tests'
    
    'LibGit-Core'
    'LibGit-FileSystem'
    'LibGit-Tests') 
do: [ :each |
    (each asPackageIfAbsent: [ 
        (each , ' not found') logCr.
        nil ])
            ifNotNil: [ :package |
                ('Removing ', each) logCr.
                package removeFromSystem ] ].
