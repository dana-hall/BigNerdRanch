//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Dana Hall on 9/14/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRHypnosisView.h"
#import "BNRImage.h"

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

//- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
//{
//    UIGraphicsBeginImageContext(newSize);
//    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return newImage;
//}

//+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
//    //UIGraphicsBeginImageContext(newSize);
//    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
//    // Pass 1.0 to force exact pixel size.
//    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
//    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width) / 2.0;
    center.y = (bounds.origin.y + bounds.size.height) / 2.0;
    
    // The circle will be the largest that will fit in the view
//    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // Add an arc to the path at center, with radius of radius, from 0 to 2*PI radians (a circle)
//    [path addArcWithCenter:center
//                    radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20.0) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"clan_hall_badge.png"];
//    [logoImage drawInRect:rect];
    
    CGRect secondFrame = CGRectMake(30, 80, 250, 300);
    BNRHypnosisView *secondView = [[BNRHypnosisView alloc] initWithFrame:secondFrame];
    secondView.backgroundColor = [UIColor clearColor];
    //    [self.window addSubview:secondView];
//    [firstView addSubview:secondView];
    [logoImage drawInRect:secondFrame];

    // Scale the image
//    UIImage *scaledImage = [logoImage scaleToSize:CGSizeMake(25.0f, 35.0f)];
//    [scaledImage drawInRect:rect];
    
//    logoImage.frame = CGRectMake(300, 150, 400, 400);

//    [UIImage *newImage = imageWithImage:logoImage
    
//    CGRect rectTemp = CGRectMake(20,20,75,75);
//    UIGraphicsBeginImageContext( rectTemp.size );
//    [logoImage drawInRect:rectTemp];
//    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    NSData *imageData = UIImagePNGRepresentation(picture1);
//    UIImage *img=[UIImage imageWithData:imageData];
    
//    [img drawInRect:rect];
    
//    UIImage *myIcon = [self.imageWithImage:logoImage scaledToSize:CGSizeMake(20, 20)];

//    CGSize newSize = CGSizeMake(20, 20);
//    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
//    [logoImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    [newImage drawInRect:rect];
//    UIGraphicsEndImageContext();

 
}


@end
