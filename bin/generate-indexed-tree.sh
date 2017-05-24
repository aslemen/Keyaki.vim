# generate-indexed-tree.sh FILE.psd
# creates FILE-indexed.pdf

ALT=F

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

PATH=$PATH:$SCRIPTPATH

while [ $# -gt 0 ]
do
    case $1 in
	-alt) ALT=T
	     shift;;
	*) break ;;
    esac
done

FILE=`echo $1 | sed 's/\.psd$//'`


if [ "$ALT" = "T" ]; then
    BRACKET="bracket_to_tikz_qtree_alt.py"
else
    BRACKET="bracket_to_tikz_qtree.py"
fi

#cd /tmp

cat $1 | parse_indexed --iml > ${FILE}-indexed.psd
draw-tree -p < ${FILE}-indexed.psd | \
    #perl -pe 's/NP-SBJ;{ENTITY\[([^ ]+)\]} *\*T\*/NP-SBJ;{ENTITY\[T\1\]} \*T\*/g' | \
    # get rid of case frame | \
    perl -pe 's/\((P|N);<.+?, /(\1 /g' | \
    perl -pe 's/\((VB2|VB|AX|P|ADJI|ADJN);<.+?> /(\1 /g' | \
    # get rid of *pro* (small pro) linking
    perl -pe 's/;({,[^ ]+,})//g' | \
    sed 's/_[0-9][0-9][0-9][0-9]_[0-9][0-9][0-9][0-9]//g' | \
    # convert to latex
    eval ${BRACKET} | \
    # format index info
#    perl -pe 's/\[\.([^ ]+);(\\{[^ ]+\\})/\[\.\\begin{tabular}[t]{c}\1\\\\[-1ex]{\\scriptsize\\textcolor{blue}{\2}}\\end{tabular}/g' | \
	perl -pe 's/ ([^ ]+);(\\{[^ ]+\\})/ \\begin{tabular}[t]{c}\1\\\\[-1ex]{\\scriptsize\\textcolor{blue}{\2}}\\end{tabular}/g' | \
	perl -pe 's/\[\.([^ ]+);(<[^ ]+>)/\[\.\\begin{tabular}[t]{c}\1\\\\[-1ex]{\\scriptsize\\textcolor{blue}{\2}}\\end{tabular}/g' | \
	# format folded node
	perl -pe 's/BEGIN-FOLD([^ ]+)END-FOLD/\\begin{tabular}[t]{l}\1\\end{tabular}/g' | \
	    sed 's/</$<$/g' | sed 's/>/$>$/g' | \
#    # some other formatting
	    sed '
s/;<,[^<>]*[[:digit:]]\+:[[:digit:]]\+@h,[^<>]*>//g
s/,EVENT\[[[:digit:]]\+\]@EVENT\>//g
s/\*PRO\*/\\textcolor{red}{*PRO*}/g
s/ENTITY/E/g
s/SITUATION/SIT/g
s/ATTRIBUTE/ATR/g
s/ATTRIB/A/g
s/EVENT/EV/g 
s/PERSON/P/g
	' | control-arrow.sh | \
#	> ${FILE}-indexed.tex
	perl -pe 's/!(.+?)!/\\textcolor{red}{\1}/g' 
#
#case $FILE in
#    *tmp-grep*)
#    ;;
#    *)
#	sed -i '/^YIELD-HERE/e cat /tmp/tmp-yield.txt' ${FILE}-indexed.tex
#	;;
#esac
#
#sed -i 's/^YIELD-HERE//' ${FILE}-indexed.tex
#
#pdflatex ${FILE}-indexed.tex
