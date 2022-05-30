IMPORT $;

file := $.File_Bitcoin.File;

outdegree := RECORD
    address := file.in_hash;
    indegree := COUNT(GROUP);
END;

outdegree_table := TABLE(file, outdegree, in_hash);
OUTPUT(outdegree_table);