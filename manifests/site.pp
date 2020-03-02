node 'default' {
    include sys_info
    #include vim_upgrade
}

node /^vm[0-9]+\.linux\.com$/ {
    file {'/tmp/HelloPuppetMaster':
        content => "Hello, puppet master!\n",
    }

    #include sys_info
    #include vim_upgrade
    #include sshd
}

#file {'/tmp/HelloPuppetMaster':
#     content => "Hello, puppet master!\n",
#}
