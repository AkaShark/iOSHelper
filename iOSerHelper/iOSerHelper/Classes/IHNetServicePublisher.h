//
//  IHNetServicePublisher.h
//  CocoaAsyncSocket
//
//  Created by Sharker on 2021/9/10.
//   服务发布

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IHNetServicePublisher : NSObject
/// 发布服务
- (void)startPushService;
@end

NS_ASSUME_NONNULL_END
