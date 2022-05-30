IMPORT $;

File_Bitcoin := $.File_Bitcoin.File;

COUNT(File_Bitcoin(out_val>=0*100000000 AND out_val<0.001*100000000));
COUNT(File_Bitcoin(out_val>=0.001*100000000 AND out_val<0.1*100000000));
COUNT(File_Bitcoin(out_val>=0.1*100000000 AND out_val<1*100000000));
COUNT(File_Bitcoin(out_val>=1*100000000 AND out_val<10*100000000));
COUNT(File_Bitcoin(out_val>=10*100000000 AND out_val<50*100000000));
COUNT(File_Bitcoin(out_val>=50*100000000 AND out_val<100*100000000));
COUNT(File_Bitcoin(out_val>=100*100000000 AND out_val<500*100000000));
COUNT(File_Bitcoin(out_val>=500*100000000 AND out_val<5000*100000000));
COUNT(File_Bitcoin(out_val>=5000*100000000 AND out_val<20000*100000000));
COUNT(File_Bitcoin(out_val>=20000*100000000 AND out_val<50000*100000000));
COUNT(File_Bitcoin(out_val>=50000*100000000));

COUNT(File_Bitcoin);