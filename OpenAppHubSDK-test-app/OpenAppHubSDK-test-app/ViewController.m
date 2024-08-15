//
//  ViewController.m
//  OpenAppHubSDK-test-app
//
//  Created by openapphub on 2024/8/15.
//

#import "ViewController.h"
#import "OpenAppHubSDK/IPAddressHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ipv4Label = [[UILabel alloc] init];
    self.ipv4Label.numberOfLines = 0;
    [self.view addSubview:self.ipv4Label];
    

    self.ipv6Label = [[UILabel alloc] init];
    self.ipv6Label.numberOfLines = 0;
    [self.view addSubview:self.ipv6Label];
    
    self.wifiSSIDLabel = [[UILabel alloc] init];
    self.wifiSSIDLabel.numberOfLines = 0;
    [self.view addSubview:self.wifiSSIDLabel];
    
    self.ipv4Label.frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 30);
    self.ipv6Label.frame = CGRectMake(20, 150, self.view.bounds.size.width - 40, 30);
    self.wifiSSIDLabel.frame = CGRectMake(20, 200, self.view.bounds.size.width - 40, 30);
    
    [self updateNetworkInfo];
}
- (void)updateNetworkInfo {
    NSString *ipv4Address = [IPAddressHelper getDevicesIPV4Address];
    NSString *ipv6Address = [IPAddressHelper getDevicesIPV6Address];
    NSString *wifiSSID = [IPAddressHelper getWiFiSSID];
    
    self.ipv4Label.text = [NSString stringWithFormat:@"IPv4 Address: %@", ipv4Address];
    self.ipv6Label.text = [NSString stringWithFormat:@"IPv6 Address: %@", ipv6Address];
    self.wifiSSIDLabel.text = [NSString stringWithFormat:@"Wi-Fi SSID: %@", wifiSSID];
}

@end
