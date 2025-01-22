# Tricky Addon - Update Target List
Configure Tricky Store target.txt with KSU WebUI.

[![Latest Release](https://img.shields.io/github/v/release/KOWX712/Tricky-Addon-Update-Target-List?label=Release&logo=github)](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/releases/latest)
[![Nightly Release](https://custom-icon-badges.demolab.com/badge/Nightly-canary_build-640064?logo=nightly-logo)](https://nightly.link/KOWX712/Tricky-Addon-Update-Target-List/workflows/build/main?status=completed)

> [!WARNING]
> This module is **not** a part of the Tricky Store module. DO NOT report any issues to Tricky Store if encountered.

## Requirements
- [Tricky store](https://github.com/5ec1cff/TrickyStore) module installed

## Instructions
### KernelSU & Apatch
- KSU WebUI

### Magisk
- Action button to open WebUI
- Support KSUWebUIStandalone and latest MMRL
- Automatic install [KSUWebUIStandalone](https://github.com/5ec1cff/KsuWebUIStandalone) if none of them are installed.

### What Can This Module Do
| Feature                                                                                                                                                                      | Status |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----: |
| Configure target.txt with app name display                                                                                                                                   |   ✅    |
| Long press to choose `!` or `?` mode for the app. [Auto](https://github.com/5ec1cff/TrickyStore/releases/tag/1.1.0)<br>Use this only  when the app cannot work without this. |   ✅    |
| Select apps from Magisk DenyList `optional`                                                                                                                                  |   ✅    |
| Deselect [unnecessary apps](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/blob/main/more-exclude.json) `optional`                                               |   ✅    |
| Set verifiedBootHash `optional`                                                                                                                                              |   ✅    |
| Provide AOSP Keybox `optional`                                                                                                                                               |   ✅    |
| Valid Keybox `not guaranteed`                                                                                                                                                |   ❌    |
| Shamiko Whitelist switch. [Why?](https://github.com/rushizgithub/shamiko?tab=readme-ov-file#whitelist)                                                                       |   ❌    |
| Periodically add all app to target.txt                                                                                                                                       |   ❌    |
| Add system apps `GMS added by default`                                                                                                                                       |   ❌    |

## Localization
- Read [Translation Guide](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/blob/main/module/webui/locales/A-translate.md)

## Acknowledgement
- [j-hc/zygisk-detach](https://github.com/j-hc/zygisk-detach) - KSU WebUI template
- [markedjs/marked](https://github.com/markedjs/marked) - Markdown Support

## Links
[![release](https://custom-icon-badges.demolab.com/badge/-Download-F25278?style=for-the-badge&logo=download&logoColor=white)](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/releases)
[![issue](https://custom-icon-badges.demolab.com/badge/-Open%20Issue-palegreen?style=for-the-badge&logoColor=black&logo=issue-opened)](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/issues)
[![changelog](https://custom-icon-badges.demolab.com/badge/-Update%20History-orange?style=for-the-badge&logo=history&logoColor=white)](https://github.com/KOWX712/Tricky-Addon-Update-Target-List/blob/main/changelog.md)
[![Telegram](https://custom-icon-badges.demolab.com/badge/-KOW's%20little%20world-blue?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/kowchannel)
