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
    IHNetServiceBrowser *publisher = [[IHNetServiceBrowser alloc] init];
    [publisher startBrowsing];
}

@end
