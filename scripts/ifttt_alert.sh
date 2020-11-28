#/bin/sh
if [ $# = 0 ]; then
  # no arguments
  process_name=$(hostname)' process'
else
  process_name=$1
fi

curl --silent --request POST --header "Content-Type: application/json" \
     --data '{"value1":"'"$process_name"'"}' \
     https://maker.ifttt.com/trigger/script_done/with/key/$IFTTT_ACCESS_TOKEN >> /dev/null

echo 'Alert fired.'
