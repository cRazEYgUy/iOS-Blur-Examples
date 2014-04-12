
//
//  FJStaticBackgroundView.m
//  BlurExample
//
//  Created by Engin Kurutepe on 01/04/14.
//  Copyright (c) 2014 Fifteen Jugglers Software. All rights reserved.
//

#import "FJFrostedGlassView.h"

@interface FJFrostedGlassView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImage *backgroundImage;

@end

@implementation FJFrostedGlassView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_backgroundImageView];
        //        self.contentMode = UIViewContentModeRedraw;
    }
    return self;
}



- (void)updateBackgroundWithSuperview:(UIView*)newSuperview
{
    UIGraphicsBeginImageContextWithOptions(newSuperview.bounds.size, YES, 0.0);
    [newSuperview drawViewHierarchyInRect:newSuperview.bounds afterScreenUpdates:YES];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *croppedImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(img.CGImage, self.frame)];
    UIGraphicsEndImageContext();
    
    self.backgroundImage = [croppedImage applyBlurWithRadius:11
                                          tintColor:[UIColor colorWithWhite:1 alpha:0.3]
                              saturationDeltaFactor:1.8
                                          maskImage:nil];    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        return;
    }
    [self updateBackgroundWithSuperview:newSuperview];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if (![_backgroundImage isEqual:backgroundImage]) {
        _backgroundImage = backgroundImage;
        _backgroundImageView.image = _backgroundImage;
    }
}




/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
