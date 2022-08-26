#!/bin/bash

touch Report.html

cat > Report.html << EOF

<!DOCTYPE html>
<html lang="fr">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>

<title>Report</title>
</head>

<body>

    <h1>Informations du système $(hostname -s)</h1>

    <h2>CPU</h2>
    </hr>
    <pre>$(cat /proc/cpuinfo | grep -i "^model name" | awk -F": " '{print $2}' | head -1 | sed 's/ \+/ /g')</pre>
    </hr>
    
    <h2>Nombre de coeurs</h2>
    </hr>
    <pre>$(cat /proc/cpuinfo | grep -i "^processor" | wc -l)</pre>
    </hr>
    
    <h2>Fréquence</h2>
    </hr>
    <pre>$(cat /proc/cpuinfo | grep -i "^cpu MHz" | awk -F": " '{print $2}' | head -1)</pre>
    </hr>

    <h2>CPU température</h2>
    </hr>
    <pre>$(sensors)</pre>
    </hr>

    <h2>Info mémoire</h1>
    </hr>
    <pre>$(free -m)</pre>
    </hr>

    <h2>Disk Info:</h2>
    </hr>
    <pre>$(df -h)</pre>
    </hr>

    <h2>Logged in user</h2>
    </hr>
    <pre>$(w)</pre>
    </hr>

    <center>Information generated on $(date)</center>
</body>

</html>
EOF
