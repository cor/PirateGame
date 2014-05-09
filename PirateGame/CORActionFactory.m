//
//  CORActionFactory.m
//  PirateGame
//
//  Created by Cor Pruijs on 04-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import "CORActionFactory.h"
#import "CORAction.h"

@implementation CORActionFactory

-(NSArray *)getActionsArray:(NSArray *) weaponsArray armorArray:(NSArray *)armorArray{
    
    CORAction *action0 = [[CORAction alloc]init];
    action0.name = @"Health boost";
    action0.healthChange = 50;

    CORAction *action1 = [[CORAction alloc]init];
    action1.name = @"Pickup sword";
    action1.healthChange = 0;
    action1.actionWeapon = [weaponsArray objectAtIndex:1];
    
    CORAction *action2 = [[CORAction alloc] init];
    action2.name = @"Pickup armor";
    action2.healthChange = 30;
    action2.actionArmor = [armorArray objectAtIndex:1];
    
    CORAction *action3 = [[CORAction alloc] init];
    action3.name = @"battle";
    
    CORAction *action4 = [[CORAction alloc] init];
    action4.name = @"drop armor";
    action4.actionArmor = [armorArray objectAtIndex:0];
    
    CORAction *action5 = [[CORAction alloc] init];
    action5.name = @"Jump";
    action5.healthChange = -5000;
    
    
    NSArray *actionsArray = [[NSArray alloc] initWithObjects:action0, action1, action2, action3, action4, action5, nil];
    
    return actionsArray;
}

@end
