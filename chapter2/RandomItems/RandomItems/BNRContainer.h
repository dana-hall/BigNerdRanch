//
//  BNRContainer.h
//  RandomItems
//
//  Created by Dana Hall on 9/7/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_items;
    NSMutableArray *_containers;
    int _totalValueInDollars;
    int _grandTotalValueInDollars;
}

- (void)setItems:(NSMutableArray *)items;
- (NSMutableArray *)items;

- (void)addItem:(BNRItem *)item;
- (BNRItem *)getItem:(int)i;

- (void)setTotalValueInDollars:(int)v;
- (int)totalValueInDollars;

- (void)setGrandTotalValueInDollars:(int)v;
- (int)grandTotalValueInDollars;

- (void)setContainers:(NSMutableArray *)containers;
- (NSMutableArray *)containers;

- (void)addContainer:(BNRContainer *)container;
- (BNRContainer *)getContainer:(int)i;

@end
