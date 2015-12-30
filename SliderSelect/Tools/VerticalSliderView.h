//
//  VerticalSliderView.h
//  SliderSelect
//
//  Created by Shelin on 15/12/18.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^VerticalSliderBlock) (CGFloat totalLength, CGFloat slidingLength);

@interface VerticalSliderView : UIView

/**
 *  初始化竖直滑块
 */
- (instancetype)initWithFrame:(CGRect)frame horizontalSliderBlock:(VerticalSliderBlock)verticalSliderHandler;

@end
