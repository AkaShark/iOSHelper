//
//  ViewController.m
//  iOSerHelper-Client
//
//  Created by Sharker on 2021/9/10.
//

#import "ViewController.h"
#import <iOSerHelper/iOSerHelper.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    IHNetServicePublisher *browser = [[IHNetServicePublisher alloc] init];
    [browser startPushService];
}



@end
