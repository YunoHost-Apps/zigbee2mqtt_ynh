#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

nodejs_version=20

#=================================================
# HELPERS
#=================================================

myynh_fix_file_permissions() {
    (
        set -x

        # /var/www/$app/
        chown -c -R "$app:www-data" "$install_dir"
        chmod -c o-rwx "$install_dir"
    )
}

myynh_setup_node_environment() {

    ynh_exec_warn_less ynh_install_nodejs --nodejs_version=$nodejs_version

    pushd "$install_dir" || exit
        ynh_use_nodejs

        myynh_fix_file_permissions

        # https://www.zigbee2mqtt.io/guide/installation/01_linux.html#installing
        ynh_exec_warn_less ynh_exec_as $app env $ynh_node_load_PATH $ynh_npm --version
        ynh_exec_warn_less ynh_exec_as $app env $ynh_node_load_PATH $ynh_npm ci
        ynh_exec_warn_less ynh_exec_as $app env $ynh_node_load_PATH $ynh_npm run build

        myynh_fix_file_permissions

    popd || exit
}


