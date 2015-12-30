//
//  HorizontalSliderView.h
//  SliderSelect
//
//  Created by Shelin on 15/12/18.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HorizontalSliderBlock) (CGFloat totalLength, CGFloat slidingLength);

@interface HorizontalSliderView : UIView

/**
 *  初始化水平滑块
 */
- (instancetype)initWithFrame:(CGRect)frame horizontalSliderBlock:(HorizontalSliderBlock)horizontalSliderHandler;

@end
