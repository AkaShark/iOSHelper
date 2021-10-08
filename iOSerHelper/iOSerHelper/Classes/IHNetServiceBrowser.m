//
//  IHNetServiceBrowser.m
//  CocoaAsyncSocket
//
//  Created by Sharker on 2021/9/10.
//

#import "IHNetServiceBrowser.h"
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

static NSString *const IHDomainString = @"local.";
static NSString *const IHServiceTypeString = @"_IH._tcp.";

static NSTimeInterval const IHResolveTimeout = 30;
static NSUInteger const IHRetrySearchServiceTimes = 3;
@interface IHNetServiceBrowser() <NSNetServiceDelegate,NSNetServiceBrowserDelegate>
@property (nonatomic, strong) NSNetServiceBrowser *browser;
@property (nonatomic, strong) NSMutableArray *services;
@end

@implementation IHNetServiceBrowser

- (instancetype)init {
    if (self = [super init]) {
        [self configBrowser];
    }
    return self;
}

- (void)configBrowser {
    self.browser = [[NSNetServiceBrowser alloc] init];
    self.browser.delegate = self;
    self.browser.includesPeerToPeer = YES;
}

- (void)startBrowsing {
    [self.browser searchForServicesOfType:@"_chat._tcp." inDomain:@"local."];
}

- (void)restartBrowsing {
    [self startBrowsing];
}

#pragma mark - Accessor
- (NSMutableArray *)services {
    if (!_services) {
        _services = [NSMutableArray arrayWithCapacity:1];
    }
    return _services;
}

#pragma mark - NSNetServiceBrowserDelegate methods
/* Sent to the NSNetServiceBrowser instance's delegate for each service discovered. If there are more services, moreComing will be YES. If for some reason handling discovered services requires significant processing, accumulating services until moreComing is NO and then doing the processing in bulk fashion may be desirable.
 */
- (void)netServiceBrowserWillSearch:(NSNetServiceBrowser *)browser {
    NSLog(@"%@", browser);
}


- (void)netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)browser {
    NSLog(@"%s", __func__);
}


/* Sent to the NSNetServiceBrowser instance's delegate for each domain discovered. If there are more domains, moreComing will be YES. If for some reason handling discovered domains requires significant processing, accumulating domains until moreComing is NO and then doing the processing in bulk fashion may be desirable.
*/
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didFindDomain:(NSString *)domainString moreComing:(BOOL)moreComing {
    NSLog(@"%s", __func__);
}


- (void)netServiceWillResolve:(NSNetService *)sender {
    NSLog(@"%s", __func__);
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didFindService:(NSNetService *)service moreComing:(BOOL)moreComing {
    [self.services addObject:service];
    service.delegate = self;
    [service resolveWithTimeout:IHResolveTimeout];
}

/* Sent to the NSNetServiceBrowser instance's delegate when a previously discovered service is no longer published.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didRemoveService:(NSNetService *)service moreComing:(BOOL)moreComing {
    [self.services removeObject:service];
    service.delegate = nil;
}

/* Sent to the NSNetServiceBrowser instance's delegate when an error in searching for domains or services has occurred. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants). It is possible for an error to occur after a search has been started successfully.
 */
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didNotSearch:(NSDictionary<NSString *, NSNumber *> *)errorDict {
    NSLog(@"Bonjour error With: %@", errorDict);
#if TARGET_OS_IPHONE
    if (@available(iOS 14.0, *)) {
        NSNetServicesError errorCode = [errorDict[@"NSNetServicesErrorCode"] integerValue];
        if (errorCode == -72008) {
            //iOS14新增本地网络隐私权限，提示用户如何设置并忽略
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSString *title = @"Echo 连接提示";
                NSString *message = @"由于iOS14本地网络权限限制，请在Info.plist中设置NSLocalNetworkUsageDescription和NSBonjourServices";
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

                }];
                [alertController addAction:confirmAction];
                UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
                [rootVC presentViewController:alertController animated:YES completion:nil];
            });
            NSLog(@"Bonjour error With NetWork auth");
            return;
        }
    }
#endif
    static int times = IHRetrySearchServiceTimes; // 重启三次
    times --;
    [self restartBrowsing];
}

#pragma mark - NSNetServiceDelegate methods

/* Sent to the NSNetService instance's delegate when one or more addresses have been resolved for an NSNetService instance. Some NSNetService methods will return different results before and after a successful resolution. An NSNetService instance may get resolved more than once; truly robust clients may wish to resolve again after an error, or to resolve more than once.
 */
- (void)netServiceDidResolveAddress:(NSNetService *)sender {
    NSString *name = [sender name];
    NSString *hostName = [sender hostName];
    NSArray<NSData *> *addrs = [[sender addresses] copy];
    !self.resolvedAdrBlock?: self.resolvedAdrBlock(addrs, hostName, name);
    
}

/* Sent to the NSNetService instance's delegate when the instance's previously running publication or resolution request has stopped.
 */
- (void)netServiceDidStop:(NSNetService *)sender {
    NSLog(@"%s", __func__);
}
@end
