#import "IPAddressHelper.h"
#import "IPAddressConfig.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation IPAddressHelper

+ (NSString *)getDevicesIPAddress:(BOOL)preferIPv4 {
    InitAddresses();
    GetIPAddresses();
    GetHWAddresses();
    
    NSString *address = nil;
    int i;
    for (i = 0; i < MAXADDRS; ++i) {
        if (if_names[i] == NULL) {
            continue;
        }
        
        if (preferIPv4) {
            if (ip_names[i] != NULL && strncmp(ip_names[i], "127.0.0.1", 9) != 0 && strncmp(ip_names[i], "0.0.0.0", 7) != 0) {
                address = [NSString stringWithUTF8String:ip_names[i]];
                if (address) {
                    break;
                }
            }
        } else {
            if (ip_names[i] != NULL && strncmp(ip_names[i], "::1", 3) != 0 && strncmp(ip_names[i], "::", 2) != 0) {
                address = [NSString stringWithUTF8String:ip_names[i]];
                if (address) {
                    break;
                }
            }
        }
    }
    
    FreeAddresses();
    return address ? address : @"0.0.0.0";
}

+ (NSString *)getDevicesIPV4Address {
    return [self getDevicesIPAddress:YES];
}

+ (NSString *)getDevicesIPV6Address {
    return [self getDevicesIPAddress:NO];
}

+ (NSString *)getWiFiSSID {
    NSString *ssid = nil;
    NSArray *interfaces = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *interfaceName in interfaces) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName);
        if (info[@"SSID"]) {
            ssid = info[@"SSID"];
            break;
        }
    }
    return ssid;
}

@end
