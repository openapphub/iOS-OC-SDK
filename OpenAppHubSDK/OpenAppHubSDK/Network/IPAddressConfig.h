//
//  IPAddressConfig.h
//  OpenAppHubSDK
//
//  Created by jin xm on 2024/8/15.
//

#ifndef IPAddressConfig_h
#define IPAddressConfig_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <errno.h>
#include <net/if_dl.h>
#include <net/ethernet.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

#define BUFFERSIZE  4000
#define MAXADDRS    32
#define min(a,b)    ((a) < (b) ? (a) : (b))
#define max(a,b)    ((a) > (b) ? (a) : (b))

@interface IPAddressConfig : NSObject

// extern
extern char *if_names[MAXADDRS];
extern char *ip_names[MAXADDRS];
extern char *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];

// Function prototypes
void InitAddresses(void);
void FreeAddresses(void);
void GetIPAddresses(void);
void GetHWAddresses(void);

@end

#endif /* IPAddressConfig_h */
