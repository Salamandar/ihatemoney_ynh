#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies=(
    python3-dev
    python3-virtualenv
    libffi-dev
    libssl-dev
    virtualenv
)

pip_dependencies=(
    'setuptools>=18.5'
    'gunicorn>=19.3.0'
    'PyMySQL>=0.9,<0.10'
    'SQLAlchemy<1.4'
    'ihatemoney>=4,<5'
)

### Constants

#=================================================
# PERSONAL HELPERS
#=================================================

__ynh_python_virtualenv_setup() {
    local -A args_array=( [d]=venv_dir= [p]=packages= )
    local venv_dir
    local packages
    ynh_handle_getopts_args "$@"

    virtualenv --python=python3 --system-site-packages "$venv_dir"

    if [[ -n "$packages" ]]; then
        IFS=" " read -r -a pip_packages <<< "$packages"

        (
            set +o nounset
            source "$venv_dir/bin/activate"
            set -o nounset

            pip install --upgrade pip
            pip install --upgrade "${pip_packages[@]}"
        )
    fi
}

__ynh_python_virtualenv_get_site_packages_dir() {
    local -A args_array=( [d]=venv_dir= )
    local venv_dir
    ynh_handle_getopts_args "$@"

    "$venv_dir/bin/python3" -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])'
}


#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
