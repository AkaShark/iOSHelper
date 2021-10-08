//
//  IHNetServiceBrowser.h
//  CocoaAsyncSocket
//
//  Created by Sharker on 2021/9/10.
//  Bonjour 发现服务 负责接受host addr port参数

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^IHHostResolvedAddrBlock)(NSArray<NSData *> *addresses, NSString *hostName, NSString *name);
@interface IHNetServiceBrowser : NSObject

@property (nonatomic, copy) IHHostResolvedAddrBlock resolvedAdrBlock;
/// 开始查找本地服务
- (void)startBrowsing;

@end

NS_ASSUME_NONNULL_END
