//
//  ViewController.m
//  iOSerHelper-MacOS
//
//  Created by Sharker on 2021/9/10.
//

#import "ViewController.h"
#import <iOSerHelper/IHNetServicePublisher.h>
#import <iOSerHelper/IHNetServiceBrowser.h>
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IHNetServicePublisher *publisher = [[IHNetServicePublisher alloc] init];
    [publisher startPushService];
    
//    IHNetServiceBrowser *browser = [[IHNetServiceBrowser alloc] init];
//    [browser startBrowsing];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}


@end
