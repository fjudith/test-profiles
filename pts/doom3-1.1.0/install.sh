#!/bin/sh

# Config File
cat > doom3-pts.cfg <<'EOT'
unbindall
bind "ESCAPE" "togglemenu"
seta com_product_lang_ext "1"
seta sv_punkbuster "0"
seta cl_punkbuster "0"
seta com_showFPS "0"
seta com_purgeAll "0"
seta com_preloadDemos "0"
seta com_compressDemos "1"
seta m_strafeSmooth "4"
seta m_smooth "1"
seta m_strafeScale "6.25"
seta m_yaw "0.022"
seta m_pitch "0.022"
seta sensitivity "5"
seta in_toggleZoom "0"
seta in_toggleCrouch "0"
seta in_toggleRun "0"
seta in_alwaysRun "0"
seta in_freeLook "1"
seta in_anglespeedkey "1.5"
seta in_pitchspeed "140"
seta in_yawspeed "140"
seta gui_configServerRate "0"
seta com_guid "ovjx6brBRRU"
seta net_clientDownload "1"
seta net_master4 ""
seta net_master3 ""
seta net_master2 ""
seta net_master1 ""
seta net_clientMaxRate "16000"
seta net_serverMaxClientRate "16000"
seta gui_filter_game "0"
seta gui_filter_idle "0"
seta gui_filter_gameType "0"
seta gui_filter_players "0"
seta gui_filter_password "0"
seta image_downSizeLimit "256"
seta image_ignoreHighQuality "1"
seta image_downSizeBumpLimit "256"
seta image_downSizeSpecularLimit "64"
seta image_downSizeBump "1"
seta image_downSizeSpecular "1"
seta image_useCache "0"
seta image_cacheMegs "20"
seta image_cacheMinK "200"
seta image_usePrecompressedTextures "1"
seta image_useNormalCompression "2"
seta image_useAllFormats "1"
seta image_useCompression "1"
seta image_preload "1"
seta image_roundDown "1"
seta image_forceDownSize "0"
seta image_downSize "1"
seta image_lodbias "0"
seta image_anisotropy "0"
seta image_filter "GL_LINEAR_MIPMAP_LINEAR"
seta r_debugArrowStep "120"
seta r_debugLineWidth "1"
seta r_debugLineDepthTest "0"
seta r_cgFragmentProfile "best"
seta r_cgVertexProfile "best"
seta r_forceLoadImages "0"
seta r_shadows "1"
seta r_skipBump "0"
seta r_skipSpecular "0"
seta r_skipNewAmbient "0"
seta r_renderer "best"
seta r_brightness "1"
seta r_gamma "1"
seta r_swapInterval "0"
seta r_useIndexBuffers "0"
seta r_fullscreen "1"
seta r_multiSamples "0"
seta gui_mediumFontLimit "0.60"
seta gui_smallFontLimit "0.30"
seta s_libOpenAL "openal32.dll"
seta s_numberOfSpeakers "6"
seta s_doorDistanceAdd "150"
seta s_globalFraction "0.8"
seta s_subFraction "0.75"
seta s_playDefaultSound "1"
seta s_volume_dB "0"
seta s_meterTopTime "2000"
seta s_reverse "0"
seta s_spatializationDecay "2"
seta s_maxSoundsPerShader "1"
seta sys_lang "english"
seta in_dgamouse "1"
seta in_mouse "1"
seta s_dsp "/dev/dsp"
seta s_driver "alsa"
seta s_alsa_lib "libasound.so.2"
seta s_alsa_pcm "default"
seta g_decals "1"
seta g_projectileLights "1"
seta g_doubleVision "1"
seta g_muzzleFlash "1"
seta net_clientLagOMeter "1"
seta g_spectatorChat "0"
seta net_serverDlTable ""
seta net_serverDlBaseURL ""
seta net_serverDownload "0"
seta mod_validSkins "skins/characters/player/marine_mp;skins/characters/player/marine_mp_green;skins/characters/player/marine_mp_blue;skins/characters/player/marine_mp_red;skins/characters/player/marine_mp_yellow"
seta g_mapCycle "mapcycle"
seta g_voteFlags "0"
seta g_gameReviewPause "10"
seta g_countDown "10"
seta g_password ""
seta g_showBrass "1"
seta g_showProjectilePct "0"
seta g_showHud "1"
seta g_showPlayerShadow "0"
seta g_showcamerainfo "0"
seta g_healthTakeLimit "25"
seta g_healthTakeAmt "5"
seta g_healthTakeTime "5"
seta g_useDynamicProtection "1"
seta g_armorProtectionMP "0.6"
seta g_armorProtection "0.3"
seta g_damageScale "1"
seta g_nightmare "0"
seta g_bloodEffects "1"
seta r_aspectRatio "0"
seta ui_showGun "1"
seta ui_autoReload "1"
seta ui_autoSwitch "1"
seta ui_team "Red"
seta ui_skin "skins/characters/player/marine_mp"
seta ui_name "Player"
seta si_serverURL ""
seta si_spectators "1"
seta si_usePass "0"
seta si_warmup "0"
seta si_teamDamage "0"
seta si_timeLimit "10"
seta si_fragLimit "10"
seta si_maxPlayers "4"
seta si_map "game/mp/d3dm1"
seta si_gameType "singleplayer"
seta si_name "DOOM Server"

EOT

# Installation

chmod +x doom3-linux-1.3.1.1304.x86.run

./doom3-linux-1.3.1.1304.x86.run --noexec --target .
mv -f doom3-pts.cfg base/doom3-pts.cfg

echo "#!/bin/sh
./bin/Linux/x86/doom.x86 \$@ > \$LOG_FILE" > doom3
chmod +x doom3

if [ -f doom3-game-files.tar ]
  then
     tar -k -C $HOME/base -xvf $HOME/doom3-game-files.tar
  else
     echo "Doom 3 Game Files (*.pk4) Must Be Copied Into $HOME/base"
fi
mkdir -p $HOME/.doom3/base/
if [ -f doom3-key.tar ]
  then
     tar -k -C $HOME/.doom3/base/ -xvf $HOME/doom3-key.tar
  else
     echo "Copy Your Game Key File To $HOME/.doom3/base/doomkey"
fi

