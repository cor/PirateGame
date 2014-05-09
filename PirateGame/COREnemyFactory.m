//
//  COREnemyFactory.m
//  PirateGame
//
//  Created by Cor Pruijs on 05-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import "COREnemyFactory.h"
#import "COREnemy.h"

@implementation COREnemyFactory


-(NSArray*)getEnemyArray {
    
    COREnemy *enemy0 = [[COREnemy alloc] init];
    enemy0.name = @"noob";
    enemy0.hp = 5;
    enemy0.damage = 3;
         NSArray *enemyArray = [[NSArray alloc] initWithObjects:enemy0, nil];
    
    return enemyArray;
}

@end
