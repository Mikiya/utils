
TODAYDIRPREFIX=~/Job/

# echo today directory
tj() {
    dirname=$TODAYDIRPREFIX`date +'%Y%m%d'`
    if [ ! -x $dirname ];
    then
        mkdir $dirname
    fi
    if [ -e $HOME/Today ];
    then
        /bin/rm -f $HOME/Today
    fi
    ln -s $dirname $HOME/Today
    echo $dirname
}

# cd to today directory
cj() {
    cd `tj`
}

