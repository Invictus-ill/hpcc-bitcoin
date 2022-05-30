IMPORT $;

file := $.File_Bitcoin.File;

indegree := RECORD
    address := file.out_addr;
    indegree := COUNT(GROUP);
END;

indegree_table := TABLE(file, indegree, out_addr);
OUTPUT(indegree_table);