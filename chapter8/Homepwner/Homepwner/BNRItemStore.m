//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Dana Hall on 10/27/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end


@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// If a programmer calls [[BNRItemStore alloc] init], let him know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRItemStore sharedStore]" userInfo:nil];
            return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (BNRItem *)createItem
{
    NSUInteger size = self.privateItems.count;
    
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems insertObject:item atIndex:size-1];
//    [self.privateItems addObject:item];
    
    return item;
}

- (BNRItem *)createLastRow
{
    BNRItem *item = [BNRItem lastRow];
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

- (BOOL)canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.privateItems.count-1) // Don't move the last row
    {
        return NO;
    }
    
    return YES;
}

- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.privateItems.count-1) // Don't edit the last row
    {
        return NO;
    }
    
    return YES;
}

- (NSIndexPath *) targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
      if (sourceIndexPath.row != proposedDestinationIndexPath.row) {
          NSInteger row = 0;
          if (sourceIndexPath.row < proposedDestinationIndexPath.row) {
              row = self.privateItems.count - 2;
          }
          return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
      }

    return proposedDestinationIndexPath;
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }

    if (toIndex >= self.privateItems.count-1) {
        return;
    }

    // Get pointer to object being moved so you can re-insert it
    BNRItem *item = self.privateItems[fromIndex];
    
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
    
}


            
@end
