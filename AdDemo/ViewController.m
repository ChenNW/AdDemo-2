//
//  ViewController.m
//  AdDemo
//
//  Created by Cnw on 2017/2/14.
//  Copyright © 2017年 Cnw. All rights reserved.
//

#import "ViewController.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@import GoogleMobileAds;

@interface ViewController ()<GADInterstitialDelegate>
@property(nonatomic, strong) GADInterstitial *interstitial;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 横幅
    self.bannerView.adUnitID = @"ca-app-pub-8621793235050362/7333894931";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[@"2077ef9a63d2b398840261c8221a0c9a"];
    [self.bannerView loadRequest:request];
    
    // 插页式
//    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-8621793235050362/3822025339"];
    self.interstitial = [self createAndLoadInterstitial];

     [self.interstitial loadRequest:request];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, kScreenH/3*2, kScreenW - 40, 50)];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"点击显示广告" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(adClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)adClick
{
    if ([self.interstitial isReady]) {
        [self.interstitial presentFromRootViewController:self];
    }
}
-(GADInterstitial *)createAndLoadInterstitial
{

    GADInterstitial *interstitial =
    [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-8621793235050362/3822025339"];
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    self.interstitial = [self createAndLoadInterstitial];
}


@end
