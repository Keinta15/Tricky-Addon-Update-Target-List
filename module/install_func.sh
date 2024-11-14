initialize() {
    if [ -f "$SCRIPT_DIR/UpdateTargetList.sh" ]; then
        rm -f "$SCRIPT_DIR/UpdateTargetList.sh"
    fi
    cp "$MODPATH/module.prop" "$COMPATH/module.prop.orig"
    mv "$COMPATH/UpdateTargetList.sh" "$SCRIPT_DIR/UpdateTargetList.sh"

    sed -i "s|\"set-path\"|\"/data/adb/modules/$MODID/common/\"|" "$MODPATH/webroot/index.js" || {
        ui_print "! Failed to replace path"
        abort
    }

    set_perm $SCRIPT_DIR/UpdateTargetList.sh 0 2000 0755
    set_perm $COMPATH/get_exclude-list.sh 0 2000 0755
}

add_exclude() {
    EXCLUDE=$(grep -vE '^[[:space:]]*#|^[[:space:]]*$' "$CONFIG_DIR/EXCLUDE")
    for app in $EXCLUDE; do
        app=$(echo "$app" | tr -d '[:space:]')
        if ! grep -Fq "$app" $COMPATH/EXCLUDE; then
            echo "$app" >> $COMPATH/EXCLUDE
        fi
    done
    mv "$COMPATH/EXCLUDE" "$CONFIG_DIR/EXCLUDE"
}

add_addition() {
    ADDITION=$(grep -vE '^[[:space:]]*#|^[[:space:]]*$' "$CONFIG_DIR/ADDITION")
    for app in $ADDITION; do
        app=$(echo "$app" | tr -d '[:space:]')
        if ! grep -Fq "$app" $COMPATH/ADDITION; then
            echo "$app" >> $COMPATH/ADDITION
        fi
    done
    mv "$COMPATH/ADDITION" "$CONFIG_DIR/ADDITION"
}

find_config() {
    if [ -d "$CONFIG_DIR" ]; then
        if [ ! -f "$CONFIG_DIR/EXCLUDE" ] && [ ! -f "$CONFIG_DIR/ADDITION" ]; then
            mv "$COMPATH/EXCLUDE" "$CONFIG_DIR/EXCLUDE"
            mv "$COMPATH/ADDITION" "$CONFIG_DIR/ADDITION"
        elif [ ! -f "$CONFIG_DIR/ADDITION" ]; then
            mv "$COMPATH/ADDITION" "$CONFIG_DIR/ADDITION"
            add_exclude
        elif [ ! -f "$CONFIG_DIR/EXCLUDE" ]; then
            mv "$COMPATH/EXCLUDE" "$CONFIG_DIR/EXCLUDE"
            add_addition
        else
            add_exclude
            add_addition
        fi
    else
        mkdir -p "$CONFIG_DIR"
        mv "$COMPATH/EXCLUDE" "$CONFIG_DIR/EXCLUDE"
        mv "$COMPATH/ADDITION" "$CONFIG_DIR/ADDITION"
    fi
}

migrate_old_boot_hash() {
    if [ ! -f "$ORG_DIR/boot_hash" ]; then
        mv "$COMPATH/boot_hash" "$MODPATH/boot_hash"
    else
        rm -f "$COMPATH/boot_hash"
        mv "$ORG_DIR/boot_hash" "$MODPATH/boot_hash"
    fi

    # Migrate from old version setup
    if [ -f "$ORG_DIR/system.prop" ]; then
        hash_value=$(sed -n 's/^ro.boot.vbmeta.digest=//p' "$ORG_DIR/system.prop")
        if [ -n "$hash_value" ]; then
            echo -e "\n$hash_value" >> "$MODPATH/boot_hash"
        fi
    fi
}

key_check() {
    while true; do
        key_check=$(/system/bin/getevent -qlc 1)
        key_event=$(echo "$key_check" | awk '{ print $3 }' | grep 'KEY_')
        key_status=$(echo "$key_check" | awk '{ print $4 }')
        if [[ "$key_event" == *"KEY_"* && "$key_status" == "DOWN" ]]; then
            keycheck="$key_event"
            break
        fi
    done
    while true; do
        key_check=$(/system/bin/getevent -qlc 1)
        key_event=$(echo "$key_check" | awk '{ print $3 }' | grep 'KEY_')
        key_status=$(echo "$key_check" | awk '{ print $4 }')
        if [[ "$key_event" == *"KEY_"* && "$key_status" == "UP" ]]; then
            break
        fi
    done
}

kb_operation() {
    if [[ "$keycheck" == "KEY_VOLUMEUP" ]]; then
        ui_print "- Backing up original keybox..."
        ui_print "- Replacing keybox..."
        ui_print "*********************************************"

        if [ -f "$ORG_DIR/common/origkeybox" ]; then
            mv "$ORG_DIR/common/origkeybox" "$COMPATH/origkeybox"
        else
            mv "$SCRIPT_DIR/keybox.xml" "$COMPATH/origkeybox"
        fi

        mv "$kb" "$SCRIPT_DIR/keybox.xml"
    else
        if [ -f "$ORG_DIR/common/origkeybox" ]; then
            mv "$ORG_DIR/common/origkeybox" "$COMPATH/origkeybox"
        else
            rm -f "$kb"
        fi
    fi
}