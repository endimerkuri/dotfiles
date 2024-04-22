if [ -e "temp.json" ]; then
    token=$(jq .data.authentication.accessToken temp.json)
    [[ "$token" != "null" ]] && sed -i~ "/^CLIENT_TOKEN=/s/=.*/=$token/" backend/vars.env
    rm temp.json
fi
