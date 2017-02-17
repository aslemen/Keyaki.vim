
perl -pe '
s/(\[\.)([^ ]+)\$\<\$E\[([0-9]+)\]\$\>\$([^ ]+) /$1\\node(${3}from){$2$3$4}; /g;
s/(\[\.)([^ ]+)\\\{E\[([0-9]+)\]\\\}([^ ]+) /$1\\node(${3}to){$2\{$3\}$4}; /g;
' $1 | \
    perl -pe 'BEGIN { $c = 0; } 
if (/node\(([0-9]+)to\)/) {
$c = $c + 1;
s/(node\([0-9]+to)\)/$1$c\)/g;
}' | \
    perl -0777 -pe '
while (/node\(([0-9]+)to([0-9]+)/) {
$I = $1;
$J = $2;
s/node\(([0-9]+)to([0-9]+)/node($1too$2/;
s/\\end\{tikzpicture\}/
\\draw[dashed,->] (${I}from)..controls +(south:5) and +(south:5)..(${I}too${J});
\\end{tikzpicture}/g;
}'

    

