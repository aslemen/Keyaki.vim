perl -pe '
s/(\[\.)([^ ]+)\$\<\$E\[(.+?)\]\$\>\$([^ ]+) /$1\\node(${3}from){$2$3$4}; /g;
s/ ([^ ]+)\\textcolor\{red\}\{\*PRO\*\}([^ ]+?)\\\{E\[(.+?)\]\\\}([^ ]+)/ \\node(${3}to)\{$1\\textcolor\{red\}\{\*PRO\*\}$2$3$4\};/g;
' $1 | \
    perl -pe 'BEGIN { $c = 0; } 
if (/node\((.+?)to\)/) {
$c = $c + 1;
s/(node\(.+?to)\)/$1$c\)/g;
}' | \
    # while (/node\(([^0-9]+?)(from|to)/) {
    perl -0777 -pe 'BEGIN { $c = 0; } 
while (/node\(([^0-9]+?|[^0-9]+?[0-9]+?|[0-9]+?[^0-9]+?|[^0-9]+?[0-9]+?[^0-9]+?)(from|to)/) {
$name = $1;
$c = $c + 1;
s/node\(${name}to/node(000${c}to/g;
s/node\(${name}from/node(000${c}from/g;
}' | \
    perl -0777 -pe '
while (/node\(([0-9]+)to([0-9]+)/) {
$I = $1;
$J = $2;
s/node\((.+?)to([0-9]+)/node($1too$2/;
if (/node\(${I}from/) {
s/\\end\{tikzpicture\}/
\\draw[thick,dashed,->] (${I}from)..controls +(-60:4) and +(-120:4)..(${I}too${J});
\\end{tikzpicture}/g;
}
}'

    

