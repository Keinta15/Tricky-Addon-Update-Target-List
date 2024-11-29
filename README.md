# **Tricky Addon - Update Target List**
A **KSU WebUI** to configure tricky store target.txt

---
## Description
- Automated script to update tricky store target list.
- System app excluded by default
- This module is **not** a part of Tricky Store module, DO NOT report to Tricky Store if you encounter any issue.
- This is **not** a necessary module for root hide but for those who lazy to do it manually

## Requirements
- [Tricky store](https://github.com/5ec1cff/TrickyStore) module installed

## Custom Configuration
- Configuration target list with **KSU WebUI**
- For Magisk users, first attempt perform action button can install KSU WebUI (optional).
- Advance configure: ADDITION and EXCLUDE in `/data/adb/tricky_store/target_list_config`

## Instructions
### Automatic update
- On boot

### Manually update
**KSU WebUI**
- Configure target list
- Save and Update

**Manual script method**
- Run `UpdateTargetList.sh` under `/data/adb/tricky_store` manually.
- MT manager is recommened for this method

## Translation
- Read [Translation Guide](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/tree/master/module/webroot/locales/A-translate.md)

## Acknowledgement
- [j-hc/zygisk-detach](https://github.com/j-hc/zygisk-detach) - KSU WebUI template

## Links
Download: [GitHub release](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/releases)

Update log: Read [ChangeLog](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/blob/master/changelog.md)

Telegram channel: [KOW's Little World](https://t.me/kowchannel)
