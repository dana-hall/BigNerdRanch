//
//  main.m
//  RandomItems
//
//  Created by Dana Hall on 9/10/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
//        // Add items to array
//        for(int i = 0; i < 10; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            items[i] = item;
//        }

        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
         
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;     
         
        // Print items in array
        for(NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}

