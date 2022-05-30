IMPORT $;

File_Bitcoin := $.File_Bitcoin.File;

result := RECORD
    out_address:= File_Bitcoin.out_addr;
    total_out_val := SUM(GROUP, File_Bitcoin.out_val);
END;

mytable := TABLE(File_Bitcoin, result, out_addr);

SORT(mytable, -total_out_val);
