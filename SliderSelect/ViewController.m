//
//  ViewController.m
//  SliderSelect
//
//  Created by Shelin on 15/12/18.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalSliderView.h"
#import "VerticalSliderView.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGRect frame_1 = CGRectMake(80, 200, 300, 40);
    HorizontalSliderView *horizontalSliderView = [[HorizontalSliderView alloc] initWithFrame:frame_1 horizontalSliderBlock:^(CGFloat totalLength, CGFloat slidingLength) {

        NSLog(@"体重为----%0.fKG", 30 + (150 - 30) * slidingLength / totalLength);
    }];
    horizontalSliderView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:horizontalSliderView];
    
    
    CGRect frame_2 = CGRectMake(80, 300, 40, 300);
    VerticalSliderView *verticalSliderView = [[VerticalSliderView alloc] initWithFrame:frame_2 horizontalSliderBlock:^(CGFloat totalLength, CGFloat slidingLength) {
        
        NSLog(@"身高为----%0.fcm", 140 + (230 - 140) *(1 - slidingLength / totalLength));
        
    }];
    verticalSliderView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:verticalSliderView];
     



}

@end
