#!/bin/tcsh -f

set qlist = $1

foreach qry (`cat $qlist`) # repeat once for every query
  echo $qry
  lynx -dump 'http://www.google.com/search?q="'$qry'"&as_epq' \
    | awk '/Results / {if ($7=="for") print $6; else print $8}' 
  sleep .1
end


