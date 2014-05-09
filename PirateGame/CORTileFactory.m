//
//  CORTileFactory.m
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import "CORTileFactory.h"
#import "CORActionFactory.h"
#import "CORAction.h"
#import "COREnemy.h"
#import "COREnemyFactory.h"

@implementation CORTileFactory

-(NSArray *)getTilesArray:(NSArray *)weaponsArray armorArray:(NSArray *)armorArray {
    
    CORActionFactory *actionFactory = [[CORActionFactory alloc] init];
    NSArray *actionsArray = [actionFactory getActionsArray:weaponsArray armorArray:armorArray];
    
    COREnemyFactory *enemyFactory = [[COREnemyFactory alloc] init];
    NSArray *enemyArray = [enemyFactory getEnemyArray];
    
    CORTile *tile1 = [[CORTile alloc]init];
    tile1.story = @"Welcome to PirateGame. PirateGame is a RPG where you pickup weapons and slay monsters. To begin, walk north";
    
    CORTile *tile2 = [[CORTile alloc]init];
    tile2.story = @"Here is some basic stuff to get you started, good luck!\n NOTE: you can only use actions once, and there's no way to undo actions. be carefull!";
    tile2.action1 = [actionsArray objectAtIndex:1];
    tile2.action2 = [actionsArray objectAtIndex:2];
    
    
    CORTile *tile3 = [[CORTile alloc]init];
    tile3.story = @"You found a health potion!\n\n also that cliff looks nice";
    tile3.action1 = [actionsArray objectAtIndex:0];
    tile3.action2 = [actionsArray objectAtIndex:5];

    
    CORTile *tile4 = [[CORTile alloc]init];
    tile4.story = @"there should be an enemy here";
    tile4.enemy = [enemyArray objectAtIndex:0];
    
    
    CORTile *tile5 = [[CORTile alloc]init];
    tile5.story = @"I don't want this armor anymore...";
    tile5.action1 = [actionsArray objectAtIndex:4];
    
    CORTile *tile6 = [[CORTile alloc]init];
    tile6.story = @"tile6 story";
    
    CORTile *tile7 = [[CORTile alloc]init];
    tile7.story = @"tile7 story";
    
    CORTile *tile8 = [[CORTile alloc]init];
    tile8.story = @"tile8 story";
    
    CORTile *tile9 = [[CORTile alloc]init];
    tile9.story = @"tile9 story";
    
    CORTile *tile10 = [[CORTile alloc]init];
    tile10.story = @"tile10 story";
    
    CORTile *tile11 = [[CORTile alloc]init];
    tile11.story = @"tile11 story";
    
    CORTile *tile12 = [[CORTile alloc]init];
    tile12.story = @"tile12 story";

    NSArray *column0Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    NSArray *column1Array = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    NSArray *column2Array = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    NSArray *column3Array = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    
    NSArray *tilesArray = [[NSArray alloc] initWithObjects:column0Array, column1Array, column2Array, column3Array, nil];
    
    for (NSArray* i in tilesArray) {
        for (CORTile* j in i ) {
            j.action1used = NO;
            j.action2used = NO;
        }
    }
    
    return tilesArray;
}

@end
