//
//  BNRItem.m
//  RandomItems
//
//  Created by Dana Hall on 9/5/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny", @"Dark", @"Bright", @"Green", @"Warm", @"Cold"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac", @"Car", @"Diddle", @"Hat", @"Park", @"Deer", @"Air"];
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger noundIndex = arc4random() % randomNounList.count;
    
//    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:noundIndex]];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[noundIndex]];

    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];

    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];

    return newItem;
}

+ (instancetype)lastRow
{
    return [[self alloc] initWithItemName:@"No More Items!"];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    self = [super init];
    if(self) {
//        _itemName = name;
//        _serialNumber = sNumber;
//        _valueInDollars = value;

        _dateCreated = [[NSDate alloc] init];

        self.itemName = name;
        self.serialNumber = sNumber;
        self.valueInDollars = value;
        
        // Create an NSUUID object - and get it's string representation
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = uuid.UUIDString;
//        NSString *key = [uuid UUIDString];
//        _itemKey = key;
        
        // Dana - to use this you will need to create getter/setter in BNRItem.h
        self.itemKey = key;
    }
    return self;
}

- (instancetype)initWithItemNameSerialNumber:(NSString *)name serialNumber:(NSString *)sNumber
{
    self = [super init];
    if(self) {
        self.itemName = name;
        self.serialNumber = sNumber;
        self.valueInDollars = 0;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (void)setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString *)itemName
{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *)serialNumber
{
    return _serialNumber;
}

- (void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (int)valueInDollars
{
    return _valueInDollars;
}

- (void)setDateCreated:(NSDate *)dc
{
    _dateCreated = dc;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (void)setItemKey:(NSString *)ik
{
    _itemKey = ik;
}

- (NSString *)itemKey
{
    return _itemKey;
}

-(NSString *)description
{
//    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
//                                   self.itemName,
//                                   self.serialNumber,
//                                   self.valueInDollars,
//                                   self.dateCreated];
//    return descriptionString;
    return [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    
}

@end
