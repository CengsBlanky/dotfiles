#! /bin/sh bash
# @since   2021-11-01 09:52
# @author  zengshuai
# @version 1.0

systemctl -l --type service --all | grep <service_name>
# check service status in detail
systemctl status <service_name>
# TODO add parameter as service_name
