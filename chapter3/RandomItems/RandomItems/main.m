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
        
        // Add items to array
        for(int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
        ////            [items addObject:item];
            items[i] = item;
        }
        
        // Print items in array
        for(NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}

