#! /bin/sh bash
# @since   2021-10-31 13:22
# @author  zengshuai
# @version 1.0

# when push in gitui error: Bad Credential
ssh-add <private-ssh-key>
# edit ~/.ssh/config, add line:
AddKeysToAgent yes
# and done
