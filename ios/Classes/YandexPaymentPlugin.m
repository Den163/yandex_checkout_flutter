#import "YandexPaymentPlugin.h"
#import <yandex_payment/yandex_payment-Swift.h>

@implementation YandexPaymentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftYandexPaymentPlugin registerWithRegistrar:registrar];
}
@end
