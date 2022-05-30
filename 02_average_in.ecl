IMPORT $;

file := $.File_Bitcoin.File;

average_in := RECORD
    address := file.in_hash;
    average_in := AVE(GROUP, file.out_val);
END;

average_in_table := TABLE(file, average_in, in_hash);
OUTPUT(average_in_table);