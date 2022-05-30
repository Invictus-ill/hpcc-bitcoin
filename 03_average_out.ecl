IMPORT $;

file := $.File_Bitcoin.File;

average_out := RECORD
    address := file.out_addr;
    average_out := AVE(GROUP, file.out_val);
END;

average_out_table := TABLE(file, average_out, out_addr);
OUTPUT(average_out_table);