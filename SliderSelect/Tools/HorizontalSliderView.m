//
//  HorizontalSliderView.m
//  SliderSelect
//
//  Created by Shelin on 15/12/18.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "HorizontalSliderView.h"
#define sliderViewWidth 40
#define sliderViewHeight self.frame.size.height

@interface HorizontalSliderView ()

@property (nonatomic, strong) HorizontalSliderBlock horizontalSliderHandler;
@property (nonatomic, strong) UIImageView *sliderView;

@end

@implementation HorizontalSliderView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)layoutSubviews {
    
    self.sliderView = [[UIImageView alloc] init];
    self.sliderView.image = [UIImage imageNamed:@"FullSizeRender.jpg"];
    self.sliderView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] init];
    [panGesture addTarget:self action:@selector(sliderPan:)];
    [self.sliderView addGestureRecognizer:panGesture];
    [self addSubview:self.sliderView];

    self.sliderView.frame = CGRectMake(0, 0, sliderViewWidth, sliderViewHeight);
}

- (instancetype)initWithFrame:(CGRect)frame horizontalSliderBlock:(HorizontalSliderBlock)horizontalSliderHandler {
    
    if ([super initWithFrame:frame]) {
        self.frame = frame;
        self.horizontalSliderHandler = horizontalSliderHandler;
    }
    return self;
}

- (void)sliderPan:(UIPanGestureRecognizer *)panGesture {
    
    CGFloat detalX = [panGesture translationInView:self.sliderView].x;
    CGRect tempFrame = self.sliderView.frame;
    tempFrame.origin.x += detalX;
    tempFrame.origin.x = tempFrame.origin.x >= 0 ? tempFrame.origin.x : 0;
    tempFrame.origin.x = tempFrame.origin.x <= (self.frame.size.width - sliderViewWidth) ? tempFrame.origin.x : (self.frame.size.width - sliderViewWidth);
    self.sliderView.frame = tempFrame;
    [panGesture setTranslation:CGPointZero inView:self.sliderView];
    
    //block调用
    self.horizontalSliderHandler(self.frame.size.width - sliderViewWidth, self.sliderView.frame.origin.x);
}


@end
