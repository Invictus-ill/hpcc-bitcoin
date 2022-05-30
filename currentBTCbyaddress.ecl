IMPORT $;

Processed_Bitcoin:= $.Processed_Bitcoin.File;

incoming := RECORD
    address := Processed_Bitcoin.out_addr;
    total_in_val := SUM(GROUP, Processed_Bitcoin.out_val);
END;

outgoing := RECORD
    address := Processed_Bitcoin.in_addr;
    total_out_val := SUM(GROUP, Processed_Bitcoin.out_val);
END;

mytable1 := TABLE(Processed_Bitcoin, incoming, out_addr);
mytable2 := TABLE(Processed_Bitcoin, outgoing, in_addr);

addresses := MERGE(mytable1, mytable2);

net := RECORD
    addresses;
    total_net := mytable2.total_out_val - mytable1.total_in_val;
END;

mytable3 := TABLE(mytable1, mytable2,, net, MERGE(mytable1.address, mytable2.address));
OUTPUT(mytable3);
// OUTPUT(mytable1);
// OUTPUT(mytable2);


// COUNT(mytable1(total_out_val>=0*100000000 AND total_out_val<1*100000000) - mytable2(total_out_val>=0*100000000 AND total_out_val<1*100000000));
// COUNT(mytable1(total_out_val>=1*100000000 AND total_out_val<10*100000000) - mytable2(total_out_val>=1*100000000 AND total_out_val<10*100000000));
// COUNT(mytable1(total_out_val>=10*100000000 AND total_out_val<100*100000000) - mytable2(total_out_val>=10*100000000 AND total_out_val<100*100000000));
// COUNT(mytable1(total_out_val>=100*100000000 AND total_out_val<1000*100000000) - mytable1(total_out_val>=100*100000000 AND total_out_val<1000*100000000));
// COUNT(mytable1(total_out_val>=1000*100000000 AND total_out_val<10000*100000000) - mytable1(total_out_val>=1000*100000000 AND total_out_val<10000*100000000));
// COUNT(mytable1(total_out_val>=10000*100000000 AND total_out_val<50000*100000000) - mytable1(total_out_val>=10000*100000000 AND total_out_val<50000*100000000));
// COUNT(mytable1(total_out_val>=50000*100000000 AND total_out_val<100000*100000000) - mytable1(total_out_val>=50000*100000000 AND total_out_val<100000*100000000));
// COUNT(mytable1(total_out_val>=100000*100000000 AND total_out_val<200000*100000000) - mytable1(total_out_val>=100000*100000000 AND total_out_val<200000*100000000));
// COUNT(mytable1(total_out_val>=200000*100000000 AND total_out_val<400000*100000000) - );
// COUNT(mytable1(total_out_val>=400000*100000000 AND total_out_val<800000*100000000));
// COUNT(mytable1(total_out_val>=800000*100000000));