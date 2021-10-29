#! bash
# @since   2021-10-29 19:09
# @author  zengshuai
# @version 1.0

sudo mkdir -p /usr/share/fonts/<FontName>
sudo mv <font file> /usr/share/fonts/
# refresh cache -f means force refresh, -v means verbose
sudo fc-cache -f -v
