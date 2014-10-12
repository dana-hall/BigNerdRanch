//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Dana Hall on 9/14/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRHypnosisView.h"
//#import "BNRImage.h"


@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.  All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

// When a finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%@ was touched", self);
    
    // Get 3 random number between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
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
//    [[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    
    // Draw the line
    [path stroke];
    
    //
    // Image section
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.9].CGColor;
    CGContextSetShadowWithColor(context, CGSizeMake(4,7), 3, shadowColor);
    
    UIImage *logoImage = [UIImage imageNamed:@"clan_hall_badge.gif"];
    
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
    
    // Clip the drawing area to just the defined triangle
    [triangle addClip];
   
    CGFloat locations[4] = {0.0, 0.33, 0.66, 0.88};
    
    // The fourth and last parameters set the opaqueness/transparency of the colors
    CGFloat components[16] = {0.0, 1.0, 0.0, 0.75, 1.0, 1.0, 0.0, 0.75, 1.0, 0.0, 0.0, 0.75, 0.0, 0.0, 1.0, 0.75};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 4);

    CGPoint startPoint = CGPointMake(0.0, 75.0);
    CGPoint endPoint = CGPointMake(0.0, bounds.size.height - 75.0);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(context);

    //
    // Hexagon
    //
    context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // Create a triangle path
    UIBezierPath *hexagon = [[UIBezierPath alloc] init];

    // Establish the hexagon points
    CGPoint hex1;
    hex1.x = 100;
    hex1.y = 100;
    
    CGPoint hex2;
    hex2.x = 150;
    hex2.y = 130;
    
    CGPoint hex3;
    hex3.x = 150;
    hex3.y = 180;
    
    CGPoint hex4;
    hex4.x = 100;
    hex4.y = 210;
    
    CGPoint hex5;
    hex5.x = 50;
    hex5.y = 180;
    
    CGPoint hex6;
    hex6.x = 50;
    hex6.y = 130;
    
    // Create the hexagon
    [hexagon moveToPoint:hex1];
    [hexagon addLineToPoint:hex2];
    [hexagon addLineToPoint:hex3];
    [hexagon addLineToPoint:hex4];
    [hexagon addLineToPoint:hex5];
    [hexagon addLineToPoint:hex6];
    
    [hexagon closePath];
    
    // Clip the drawing area to just the defined triangle
    [hexagon addClip];
    
    //    CGFloat locations[2] = {0.0, 1.0};
    CGFloat locationsHex[4] = {0.10, 0.20, 0.30, 0.40};
    
    // The fourth and last parameters set the opaqueness/transparency of the colors
    // We will set the hex colors to random also using the values from the circleColor
    
//    CGFloat componentsHex[16] = {0.0, 0.0, 1.0, 0.85, 1.0, 1.0, 0.0, 0.85, 1.0, 0.0, 0.0, 0.85, 0.0, 1.0, 0.0, 0.85};
    
    // Create a color pointer so we can get to the elements in the UIColor circleColor
    CGFloat *randomColorComponents = (CGFloat *)CGColorGetComponents([self.circleColor CGColor]);

    CGFloat componentsHex[16] = {
        randomColorComponents[0], randomColorComponents[1], randomColorComponents[2], 0.85,
        randomColorComponents[1], randomColorComponents[2], randomColorComponents[0], 0.85,
        randomColorComponents[2], randomColorComponents[0], randomColorComponents[1], 0.85,
        randomColorComponents[0], randomColorComponents[2], randomColorComponents[1], 0.85};
    
    CGColorSpaceRef colorSpaceHex = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradientHex = CGGradientCreateWithColorComponents(colorSpaceHex, componentsHex, locationsHex, 4);
    
    CGPoint startPointHex = CGPointMake(45.0, 0.0);
    CGPoint endPointHex = CGPointMake(275.0, 0.0);
    CGContextDrawLinearGradient(context, gradientHex, startPointHex, endPointHex, kCGGradientDrawsBeforeStartLocation |kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradientHex);
    CGColorSpaceRelease(colorSpaceHex);
    CGContextRestoreGState(context);
    
}


@end
