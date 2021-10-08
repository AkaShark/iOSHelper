//
//  IHNetServicePublisher.m
//  CocoaAsyncSocket
//
//  Created by Sharker on 2021/9/10.
// Publisher 只负责发布服务 不负责继续解析 通过这个只是传递 port addr

#import "IHNetServicePublisher.h"
static NSString *const IHDomainString = @"";
static NSString *const IHServiceTypeString = @"_IH._tcp.";
static NSString *const IHServiceNameString = @"";
static int const IHServicePort = 65268;
@interface IHNetServicePublisher()<NSNetServiceDelegate, NSNetServiceBrowserDelegate>
@property (nonatomic, strong) NSNetService *service;
@end

@implementation IHNetServicePublisher

- (void)startPushService {
//    self.service = [[NSNetService alloc] initWithDomain:@"local." type:@"_probonjore._tcp." name:[UIDevice currentDevice].name port:IHServicePort];
    self.service = [[NSNetService alloc] initWithDomain:@"" type:@"_helper._tcp." name:[UIDevice currentDevice].name port:65268];
    self.service.delegate = self;
    [self.service publish];
}

#pragma mark - NSNetServiceDelegate methods
- (void)netServiceDidPublish:(NSNetService *)sender {
    NSLog(@"Bonjour service published. domain:%@, type:%@, name:%@, port:%ld", sender.domain, sender.type, sender.name, (long)sender.port);
}
- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary<NSString *,NSNumber *> *)errorDict {
    NSLog(@"Bonjour service not published with:%@",errorDict);
}

@end
