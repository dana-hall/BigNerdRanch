//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Dana Hall on 9/14/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRHypnosisView.h"
//#import "BNRImage.h"

@implementation BNRHypnosisView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.  All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    //
    // Concentric circles section
    //
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width) / 2.0;
    center.y = (bounds.origin.y + bounds.size.height) / 2.0;
    
    // The circle will be the largest that will fit in the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // Add an arc to the path at center, with radius of radius, from 0 to 2*PI radians (a circle)
//    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20.0) {
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 4.0) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure line width to 10 points
//    path.lineWidth = 10;
    path.lineWidth = 2;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line
    [path stroke];
    
    //
    // Image section
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
//    CGContextSetShadow(context, CGSizeMake(4,7), 3);
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.9].CGColor;
    CGContextSetShadowWithColor(context, CGSizeMake(4,7), 3, shadowColor);
    
    UIImage *logoImage = [UIImage imageNamed:@"clan_hall_badge.gif"];
//    [logoImage drawInRect:rect];
    
    float imageWidth = 250.0;
    float imageHeight = 315.0;
    float imageX = center.x - (imageWidth/2.0);
    float imageY = center.y - (imageHeight/2.0);
    
    CGRect imageRect = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    [logoImage drawInRect:imageRect];

    CGContextRestoreGState(context);
    
    //
    // Gradient section
    //
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // Create a triangle path
    UIBezierPath *triangle = [[UIBezierPath alloc] init];
    
    float triangleHeight = 250.0;
    float triangleWidth = 200.0;
    float offset = 20.0;
    
    // Establish the triangle points
    CGPoint triangleTop;
    triangleTop.x = (bounds.size.width/2.0);
    triangleTop.y = (bounds.size.height/2.0) - (triangleHeight/2);
    
    CGPoint triangleLeft;
    triangleLeft.x = (bounds.size.width/2.0) - (triangleWidth/2);
    triangleLeft.y = (bounds.size.height/2.0) + (triangleHeight/2) + offset;
    
    CGPoint triangleRight;
    triangleRight.x = (bounds.size.width/2.0) + (triangleWidth/2);
    triangleRight.y = (bounds.size.height/2.0) + (triangleHeight/2);
    
    // Create the triangle
    [triangle moveToPoint:triangleLeft];
    [triangle addLineToPoint:triangleTop];
    [triangle addLineToPoint:triangleRight];
    [triangle addLineToPoint:triangleLeft];
    
    [triangle closePath];
    
//    [triangle stroke];
    
    // Clip the drawing area to just the defined triangle
    [triangle addClip];
   
    CGFloat locations[2] = {0.0, 1.0};
    
    // The fourth and last parameters set the opaqueness/transparency of the colors
    CGFloat components[8] = {0.0, 1.0, 0.0, 0.75, 1.0, 1.0, 0.0, 0.75};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);

    CGPoint startPoint = CGPointMake(0.0, 75.0);
    CGPoint endPoint = CGPointMake(0.0, bounds.size.height - 75.0);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(context);
     
}


@end
