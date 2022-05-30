IMPORT $;

File_Bitcoin := $.File_Bitcoin.File;

MySet := SORT(File_Bitcoin, -out_val);
OUTPUT(MySet);

// COUNT(File_Bitcoin(out_val>=0 AND out_val<=0.001));
// COUNT(File_Bitcoin(out_val>=0.001 AND out_val<=0.1));
// COUNT(File_Bitcoin(out_val>=0.1 AND out_val<=1));
// COUNT(File_Bitcoin(out_val>=1 AND out_val<=10));
// COUNT(File_Bitcoin(out_val>=10 AND out_val<=50));
// COUNT(File_Bitcoin(out_val>=50 AND out_val<=100));
// COUNT(File_Bitcoin(out_val>=100 AND out_val<=500));
// COUNT(File_Bitcoin(out_val>=500 AND out_val<=5000));
// COUNT(File_Bitcoin(out_val>=5000 AND out_val<=20000));
// COUNT(File_Bitcoin(out_val>=20000 AND out_val<=50000));
// COUNT(File_Bitcoin(out_val>=50000));