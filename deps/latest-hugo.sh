
URL="https://api.github.com/repos/gohugoio/hugo/releases/latest"
curl -q "$URL" 2>/dev/null |
    jq .assets.[].browser_download_url |
    grep deb | grep extended | grep amd64 | grep -v withdeploy |
    perl -plE 's/^"//; s/"$//;'
