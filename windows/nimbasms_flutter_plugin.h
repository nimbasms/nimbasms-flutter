#ifndef FLUTTER_PLUGIN_NIMBASMS_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_NIMBASMS_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace nimbasms_flutter {

class NimbasmsFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NimbasmsFlutterPlugin();

  virtual ~NimbasmsFlutterPlugin();

  // Disallow copy and assign.
  NimbasmsFlutterPlugin(const NimbasmsFlutterPlugin&) = delete;
  NimbasmsFlutterPlugin& operator=(const NimbasmsFlutterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace nimbasms_flutter

#endif  // FLUTTER_PLUGIN_NIMBASMS_FLUTTER_PLUGIN_H_
