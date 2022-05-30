IMPORT $;

File_Bitcoin := $.File_Bitcoin.File;

result := RECORD
    address:= File_Bitcoin.out_addr;
    addr_count := COUNT(GROUP);
END;

mytable := TABLE(File_Bitcoin, result, out_addr);
sorted_table := SORT(mytable, -addr_count);
OUTPUT(sorted_table);