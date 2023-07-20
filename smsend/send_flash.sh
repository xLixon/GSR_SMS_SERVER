while getopts t:m: flag
do
    case "${flag}" in
        t) tel=${OPTARG};;
        m) msg=${OPTARG};;
    esac
done
# shellcheck disable=SC2028
echo "AT+CSMP=17,167,0,16" > /dev/ttyUSB0
sleep 0.2
echo "AT+CMGF=1" > /dev/ttyUSB0
sleep 0.2
# shellcheck disable=SC2028
echo "AT+CMGS=\"$tel\"" > /dev/ttyUSB0
sleep 0.2
# shellcheck disable=SC2028
echo -n "$msg" > /dev/ttyUSB0
echo -e '\x1A' > /dev/ttyUSB0