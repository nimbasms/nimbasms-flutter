#include "include/nimbasms_flutter/nimbasms_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "nimbasms_flutter_plugin.h"

void NimbasmsFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  nimbasms_flutter::NimbasmsFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
