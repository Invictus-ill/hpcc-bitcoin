IMPORT $;

File_Bitcoin := $.File_Bitcoin.File;

result := RECORD
    out_address:= File_Bitcoin.out_addr;
    total_out_val := SUM(GROUP, File_Bitcoin.out_val);
END;

mytable := TABLE(File_Bitcoin, result, out_addr);
OUTPUT(mytable);


COUNT(mytable(total_out_val>=0*100000000 AND total_out_val<1*100000000));
COUNT(mytable(total_out_val>=1*100000000 AND total_out_val<10*100000000));
COUNT(mytable(total_out_val>=10*100000000 AND total_out_val<100*100000000));
COUNT(mytable(total_out_val>=100*100000000 AND total_out_val<1000*100000000));
COUNT(mytable(total_out_val>=1000*100000000 AND total_out_val<10000*100000000));
COUNT(mytable(total_out_val>=10000*100000000 AND total_out_val<50000*100000000));
COUNT(mytable(total_out_val>=50000*100000000 AND total_out_val<100000*100000000));
COUNT(mytable(total_out_val>=100000*100000000 AND total_out_val<200000*100000000));
COUNT(mytable(total_out_val>=200000*100000000 AND total_out_val<400000*100000000));
COUNT(mytable(total_out_val>=400000*100000000 AND total_out_val<800000*100000000));
COUNT(mytable(total_out_val>=800000*100000000));