//
//  VerticalSliderView.m
//  SliderSelect
//
//  Created by Shelin on 15/12/18.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "VerticalSliderView.h"
#define sliderViewWidth self.frame.size.width
#define sliderViewHeight 40

@interface VerticalSliderView()

@property (nonatomic, strong) VerticalSliderBlock verticalSliderHandler;
@property (nonatomic, strong) UIImageView *sliderView;

@end

@implementation VerticalSliderView

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

- (void)sliderPan:(UIPanGestureRecognizer *)panGesture {
    CGFloat detalY = [panGesture translationInView:self.sliderView].y;
    CGRect tempFrame = self.sliderView.frame;
    tempFrame.origin.y += detalY;
    tempFrame.origin.y = tempFrame.origin.y >= 0 ? tempFrame.origin.y : 0;
    tempFrame.origin.y = tempFrame.origin.y <= (self.frame.size.height - sliderViewHeight) ? tempFrame.origin.y : (self.frame.size.height - sliderViewHeight);
    self.sliderView.frame = tempFrame;
    [panGesture setTranslation:CGPointZero inView:self.sliderView];
    
    //block调用
    self.verticalSliderHandler(self.frame.size.height - sliderViewHeight, self.sliderView.frame.origin.y);
    
}

- (instancetype)initWithFrame:(CGRect)frame horizontalSliderBlock:(VerticalSliderBlock)verticalSliderHandler{
    
    if ([super initWithFrame:frame]) {
        self.frame = frame;
        self.verticalSliderHandler = verticalSliderHandler;
    }
    return self;
}



@end
