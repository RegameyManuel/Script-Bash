#!/bin/bash

# Functions to get system info
get_info() {
    local cmd=$1
    shift
    if command -v "$cmd" &> /dev/null; then
        "$cmd" "$@"
    else
        echo "Command $cmd not found."
    fi
}

cpu_info() {
    local info=$(get_info cat /proc/cpuinfo)
    echo "${info}" | grep 'Model' | uniq
    echo "${info}" | grep 'model name' | uniq
    echo "Nombre de Coeur(s) :  $(echo "${info}" | grep -i "^processor" | wc -l)"
    echo "${info}" | grep -i "^cpu MHz" | awk -F": " '{print $3}' | head -1
}

# HTML and CSS
html_begin() {
    cat <<EOF
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Report</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<style>
body {
    background-color: #000;
    color: #00ff00;
}
</style>
</head>
<body>
<div class="container">
    <h1>Informations du système $(get_info hostname -s)</h1>
EOF
}

html_end() {
    cat <<EOF
</div>
</body>
</html>
EOF
}

# Main script
touch index.html
exec 3<> index.html
html_begin >&3
{
    echo "<h2>Système</h2><hr>"
    cpu_info
    echo "<h2>Fréquence</h2><hr>"
    get_info vcgencmd measure_clock arm
    echo "<h2>Température</h2><hr>"
    get_info vcgencmd measure_temp
    get_info sensors
    echo "<h2>Info mémoire</h2><hr>"
    get_info free -m
    echo "<h2>Disk Info:</h2><hr>"
    get_info df -h
    echo "<h2>Logged in user</h2><hr>"
    get_info w
    echo "<center>Information generated on $(get_info date)</center>"
} | while IFS= read -r line; do
    echo "<pre>$line</pre><hr>" >&3
done
html_end >&3

exec 3>&-

