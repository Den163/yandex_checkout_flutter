package com.example.yandex_checkout

import YandexCheckoutFlutter
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class YandexCheckoutPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "yandex_payment")
      channel.setMethodCallHandler(YandexCheckoutPlugin())

      YandexCheckoutFlutter(registrar)
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {}
}
