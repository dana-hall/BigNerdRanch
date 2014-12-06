//
//  BNRItem.h
//  RandomItems
//
//  Created by Dana Hall on 9/5/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+ (instancetype)randomItem;
+ (instancetype)lastRow;

// No need to declare init?? Probably because it is in NSObject and declared somewhere in Foundation.h
// same applies to description below

// Designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name;
- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemNameSerialNumber:(NSString *)name serialNumber:(NSString *)sNumber;

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (void)setDateCreated:(NSDate *)dc;
- (NSDate *)dateCreated;

// Not needed ???
//-(NSString *)description;

@end
