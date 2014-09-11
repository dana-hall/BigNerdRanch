//
//  main.m
//  RandomItems
//
//  Created by Dana Hall on 9/4/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
 //       NSLog(@"Hello, World!");
        
//        NSMutableArray *items = [[NSMutableArray alloc] init];
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        [items addObject:@"Five"];
//        [items insertObject:@"Zero" atIndex:0];
//        [items insertObject:@"Four" atIndex:4];
//        
//        int i = 0;
//        for(NSString *item in items) {
//            NSLog(@"%d: %@", i++, item);
//        }

//        BNRItem *item = [[BNRItem alloc] init];
//        item.itemName = @"Red Sofa";
//        [item setSerialNumber:@"A1B2C"];
//        item.valueInDollars = 100;

//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Green Chair" valueInDollars:150 serialNumber:@"CB-830"];
//        NSLog(@"%@", item);
//
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Dresser"];
//        NSLog(@"%@", itemWithName);
//
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//        NSLog(@"%@", itemWithNoName);
//        
//        BNRItem *itemWithNameSerialNumber = [[BNRItem alloc] initWithItemNameSerialNumber:@"Purple Sink" serialNumber:@"12345"];
//        NSLog(@"%@", itemWithNameSerialNumber);

//        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);
//        NSLog(@"%@ %@ %@ %d", item.itemName, item.dateCreated, item.serialNumber, item.valueInDollars);
//        NSLog(@"%@", item);

        // Add items to array
//        for(int i = 0; i < 10; i++) {
//            BNRItem *item = [BNRItem randomItem];
////            [items addObject:item];
//            items[i] = item;
//        }
        
        // This creates bugs for testing purposes
//        id lastObj = [items lastObject];
//        [lastObj count];

//        id lastObj = items[10];
        
        // Print items in array
//        for(NSString *item in items) {
//            NSLog(@"%@", item);
//        }
//
//        items = nil;
        
        BNRContainer *mainContainer = [[BNRContainer alloc] init];

        for(int i = 0; i < 3; i++) {
            BNRContainer *container = [[BNRContainer alloc] init];
            
            // Add items to array
            for(int i = 0; i < 5; i++) {
                BNRItem *item = [BNRItem randomItem];
                [container addItem:item];
            }
            [mainContainer addContainer:container];
        }

//        // Add items to array
//        for(int i = 0; i < 5; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [container1 addItem:item];
////             container.items[i] = item;
//        }
//        
//        BNRContainer *container2 = [[BNRContainer alloc] init];
//        
//        // Add items to array
//        for(int i = 0; i < 5; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [container2 addItem:item];
//            //             container.items[i] = item;
//        }
//        
//        [mainContainer addContainer:container1];
//        [mainContainer addContainer:container2];
//        
        NSLog(@"%@", mainContainer);
        
        mainContainer.items = nil;
        mainContainer.containers = nil;
    }
    return 0;
}

