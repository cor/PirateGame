//
//  CORArmorFactory.m
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import "CORArmorFactory.h"
#import "CORArmor.h"

@implementation CORArmorFactory

// Armor id's :
// 0    none
// 1    leather
// 2    golden
// 3    chain
// 4    iron
// 5    diamond

- ( NSArray *) getArmorArray {
    
    CORArmor *none = [[CORArmor alloc]init];
    none.armor = 0;
    none.name = @"none";
    
    CORArmor *leather = [[CORArmor alloc] init];
    leather.armor = 7;
    leather.name = @"Leather";
    leather.image = [UIImage imageNamed:@"leatherArmor.png"];
    
    CORArmor *golden = [[CORArmor alloc] init];
    golden.armor = 11;
    golden.name = @"Golden";
    
    CORArmor *chain = [[CORArmor alloc] init];
    chain.armor = 12;
    chain.name = @"Chain";
    
    CORArmor *iron = [[CORArmor alloc] init];
    iron.armor = 15;
    iron.name = @"Iron";
    
    CORArmor *diamond = [[CORArmor alloc] init];
    diamond.armor = 20;
    diamond.name = @"Diamond";
    
    NSArray *armorArray = [[NSArray alloc] initWithObjects:none, leather, golden, chain, iron, diamond, nil];
    
    return armorArray;
}

@end
