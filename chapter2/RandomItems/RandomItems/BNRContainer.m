//
//  BNRContainer.m
//  RandomItems
//
//  Created by Dana Hall on 9/7/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)init
{
    self = [super init];

    BNRItem *item = [BNRItem randomItem];
    self.itemName = item.itemName;
    self.valueInDollars = item.valueInDollars;
//    self.totalValueInDollars = item.valueInDollars;
//    self.grandTotalValueInDollars = item.valueInDollars;
    self.serialNumber = item.serialNumber;
    self->_dateCreated = item.dateCreated;
    
    return self;
}
        
- (void)setItems:(NSMutableArray *)items
{
    _items = items;
}

- (NSMutableArray *)items
{
    return _items;
}

- (void)addItem:(BNRItem *)item
{
    if(_items == nil) {
        _items = [[NSMutableArray alloc] init];
    }
    [_items addObject:item];
    self.totalValueInDollars += item.valueInDollars;
}

- (BNRItem *)getItem:(int)i
{
    return _items[i];
}

- (void)addContainer:(BNRContainer *)container
{
    if(_containers == nil) {
        _containers = [[NSMutableArray alloc] init];
    }
    [_containers addObject:container];
    self.grandTotalValueInDollars += container.totalValueInDollars;
}

- (BNRContainer *)getContainer:(int)i
{
    return _containers[i];
}

- (void)setContainers:(NSMutableArray *)containers
{
    _containers = containers;
}

- (NSMutableArray *)containers
{
    return _containers;
}

- (void)setValueInDollars:(int)v
{
    _valueInDollars = v;
    _totalValueInDollars += v;
    _grandTotalValueInDollars += v;
}

- (void)setTotalValueInDollars:(int)v
{
    _totalValueInDollars = v;
//    _grandTotalValueInDollars += v;
}

- (int)totalValueInDollars
{
    return _totalValueInDollars;
}

- (void)setGrandTotalValueInDollars:(int)v
{
    _grandTotalValueInDollars = v;
}

- (int)grandTotalValueInDollars
{
    return _grandTotalValueInDollars;
}

-(NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString string];
   
    if(_containers != nil)
    {
        NSMutableString *mainContinerString = [NSMutableString string];
        [mainContinerString appendString:[NSString stringWithFormat:@"\nMain Container -"]];
        [descriptionString appendString:[NSString stringWithFormat:@"%@", mainContinerString]];
    }
    
    NSString *containerString = [[NSString alloc] initWithFormat:@"\nContainer:\n     %@ (%@): Worth: $%d, recorded on %@\n     Total value: $%d",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated,
                                   self.totalValueInDollars];
    
    [descriptionString appendString:[NSString stringWithFormat:@"%@\n", containerString]];
    
    if(_containers != nil)
    {
        containerString = [[NSString alloc] initWithFormat:@"     Grand Total value: $%d",
                                 self.grandTotalValueInDollars];
        [descriptionString appendString:[NSString stringWithFormat:@"%@\n", containerString]];
    }
    
    // print items array
    if(_items != nil) {
        [descriptionString appendString:[NSString stringWithFormat:@"Summary Items:\n"]];
        for(NSString *item in _items) {
            [descriptionString appendString:[NSString stringWithFormat:@"     %@\n", item.description]];
        }
    }

    // print containers array
    for(NSString *container in _containers) {
        [descriptionString appendString:[NSString stringWithFormat:@"     %@\n", container.description]];
    }
    
    return descriptionString;
}

@end
