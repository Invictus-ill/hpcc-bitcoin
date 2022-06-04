IMPORT $;
IMPORT STD;

file := $.Processed_Bitcoin.file;
IN_LAYOUT := $.Processed_Bitcoin.Layout;

MyOutRec := RECORD
    IN_LAYOUT;
    INTEGER  unix_time;
END;

MyOutRec TimeData(IN_LAYOUT x) := TRANSFORM
    SELF.unix_time := STD.DATE.FromStringToSeconds(x.timestamp, '%Y-%m-%d %H:%M:%S', FALSE);
    SELF := x
END;

EXPORT timeseries := PROJECT(file, TimeData(LEFT)):
                                PERSIST('Unix_Time');
