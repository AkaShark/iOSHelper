//
//  ViewController.m
//  iOSerHelper-Client
//
//  Created by Sharker on 2021/9/10.
//

#import "ViewController.h"
#import <iOSerHelper/IHNetServicePublisher.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    IHNetServicePublisher *publish = [[IHNetServicePublisher alloc] init];
    [publish startPushService];
}



@end
