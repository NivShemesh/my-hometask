    jenkinsUcJson=$(curl ${CURL_OPTIONS:--sSfL} -o /dev/null -w "%{url_effective}" "${JENKINS_UC}/update-center.json?version=${jenkinsVersion}")
    if [ -n "${jenkinsUcJson}" ]; then
        JENKINS_UC_LATEST=${jenkinsUcJson//update-center.json/}
        echo "Using version-specific update center: $JENKINS_UC_LATEST..."
    else
        JENKINS_UC_LATEST=
    fi

    echo "Downloading plugins..."
    for plugin in "${plugins[@]}"; do
        local reg='^([^:]+):?([^:]+)?:?([^:]+)?:?(http.+)?'
        if [[ $plugin =~ $reg ]]; then
            local pluginId="${BASH_REMATCH[1]}"
            local version="${BASH_REMATCH[2]}"
            local lock="${BASH_REMATCH[3]}"
            local url="${BASH_REMATCH[4]}"
            download "$pluginId" "$version" "${lock:-true}" "${url}" &
        else
          echo "Skipping the line '${plugin}' as it does not look like a reference to a plugin"
        fi
    done
    wait

    echo
    echo "WAR bundled plugins:"
    echo "${bundledPlugins}"
    echo
    echo "Installed plugins:"
    installedPlugins

    if [[ -f $FAILED ]]; then
        echo "Some plugins failed to download!" "$(<"$FAILED")" >&2
        exit 1
    fi

    echo "Cleaning up locks"
    find "$REF_DIR" -regex ".*.lock" | while read -r filepath; do
        rm -r "$filepath"
    done

}

main "$@"
