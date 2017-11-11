meta-data
description ^ 'I contain the libgit binding for the FileTree export format. 

Iceberg can manage different export format and FileTree is one of them. It will export with a file per method format. The pro of this format is that it is easy to get a fine grained history. The cons of this format is that it will create a lot of small files. When a project contains a lot of small file it takes much more space on the disk because of the file system''s blocs minimum space. Also it can cause troubles on windows because of the long names of methods. '