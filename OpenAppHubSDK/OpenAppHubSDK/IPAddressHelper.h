#import <Foundation/Foundation.h>

@interface IPAddressHelper : NSObject

// 获取IPV4地址
+ (NSString *)getDevicesIPV4Address;

// 获取IPV6地址
+ (NSString *)getDevicesIPV6Address;

// 获取WiFi名称
+ (NSString *)getWiFiSSID;

@end
