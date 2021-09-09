# Read input variables
COMPONENT=$1
STATUS=$2

echo $STATUS

# Default message
MESSAGE=""$COMPONENT" failed :no_entry:"
if [ $STATUS = 0 ]; then
    MESSAGE=""$COMPONENT" passed :white_check_mark:"
fi

# Send notification
# Don't store secret webhooks in public repositories... Just for demonstration purposes
curl -X POST \
  https://discord.com/api/webhooks/885276670121111602/3F9Nw-k6zKZzZkuYlK-ZQpSEKg46eV1IlS_tvZ3Axu_CelANcHN1N9Vs418-2XBIrHXO \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
	"content":"'"$MESSAGE"'"
}'
