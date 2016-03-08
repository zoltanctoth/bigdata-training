log = LOAD 'web.log' USING PigStorage(' ') 
    AS (date:chararray, time:chararray, action:chararray, 
    	source:chararray, email:chararray,ip:chararray);

registrations = FILTER log BY action == 'registration';
source_only = FOREACH registrations GENERATE source;
sources = DISTINCT source_only;

DUMP sources;
