#!/bin/tcsh -f

set qlist = $1

foreach qry (`cat $qlist`) # repeat once for every query
  echo $qry
  lynx -dump 'http://www.google.com/search?q="'$qry'"&as_epq' \
#    | awk '/results / {if ($3=="for"); else print $3}' 
  sleep .1
end


