# silly.sh
# stupid aliases

alias sl="sl -Fl"
alias fuckbitches="speak-ng 'get money'"

# oneliner to update / install betterdiscord at the flatpak install location
# https://github.com/BetterDiscord/Installer/issues/264#issuecomment-1216171370
alias betterdiscord-update="DISC_CONFIG=\"\$HOME/.var/app/com.discordapp.Discord/config/discord\" && BD_ASAR=betterdiscord.asar && wget --timestamping -P \"\${DISC_CONFIG}/../BetterDiscord/data\" -- \"https://github.com/BetterDiscord/BetterDiscord/releases/latest/download/\${BD_ASAR}\" && DISC_VER=\"\$(ls --sort=time --time=creation \"\${DISC_CONFIG}\" | grep -E -m 1 '^[0-9]+\\.[0-9]+\\.[0-9]+\$')\" && echo -e \"require('../../../../BetterDiscord/data/\${BD_ASAR}');\\nmodule.exports = require('./core.asar');\" | tee \"\${DISC_CONFIG}/\${DISC_VER}/modules/discord_desktop_core/index.js\" && echo -e \"\\nBetterDiscord installed. Restart Discord if currently running.\" || echo -e \"\\nInstallation failed.\""
