//
//  IHNetServicePublisher.m
//  CocoaAsyncSocket
//
//  Created by Sharker on 2021/9/10.
// Publisher 负责发布服务

#import "IHNetServicePublisher.h"
static NSString *const IHDomainString = @"";
static NSString *const IHServiceTypeString = @"_IH._tcp.";
static NSString *const IHServiceNameString = @"iOSHeplerService";
static int const IHServicePort = 9169;

@interface IHNetServicePublisher()<NSNetServiceDelegate>
@property (nonatomic, strong) NSNetService *service;
@end

@implementation IHNetServicePublisher
- (instancetype)init {
    if (self = [super init]) {
        [self configServicePublisher];
    }
    return self;
}

- (void)configServicePublisher {
    self.service = [[NSNetService alloc] initWithDomain:IHDomainString type:IHServiceTypeString name:IHServiceNameString port:IHServicePort];
    self.service.delegate = self;
}

- (void)startPushService {
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
