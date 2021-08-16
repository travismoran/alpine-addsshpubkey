#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# ENV Var tests
test_sshpubkey (
[ -z "$sshpubkey" ] && echo "ENV Variable 'sshpubkey' is Empty, please add your SSH Public Key as an the ENV Variable 'sshpubkey'.  Example - docker run -it --env sshpubkey="EXAMPLESSHPUBKEY" 9bb4212d00c0fbfa echo $sshpubkey" && exit 1
)

test_sshuser (
[ -z "$sshuser" ] && echo "ENV Variable 'sshuser' is Empty, please add your SSH Public Key as an the ENV Variable 'sshuser'.  Example - docker run -it --env sshuser="ubuntu" 9bb4212d00c0fbfa echo $sshuser" && exit 1
)

test_sshloc (
    [ -z "$sshuser" ] && echo "ENV Variable 'sshloc' is Empty" && exit 1
)

get_sshuser (
if [ "$sshuser" = root ]; then
    test_sshuser
    sshloc = "/root/.ssh"
else
    test_sshuser
    sshloc = "/home/$sshuser"
fi
)

check_ak (
    grep -Fxq "$sshpubkey" $sshloc/authorized_keys || echo "$sshpubkey" >> $sshloc/authorized_keys
)

main (
    test_sshpubkey
    get_sshuser
    echo $sshloc/authorized_keys
    test_sshloc
    #check_ak
    sh
)

main
