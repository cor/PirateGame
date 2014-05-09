//
//  CORWeaponFactory.m
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import "CORWeaponFactory.h"
#import "CORWeapon.h"

@implementation CORWeaponFactory

// Weapon id's
// 0    none
// 1    Wooden Sword
// 2    Shotbow
// 3    Rune Scimitar
// 4    Gravity Gun

- (NSArray *)getWeaponsArray {
    
    CORWeapon *none = [[CORWeapon alloc] init];
    none.damage = 0;
    none.name = @"none";
    
    CORWeapon *woodenSword = [[CORWeapon alloc] init];
    woodenSword.damage = 5;
    woodenSword.name = @"Wooden Sword";
    woodenSword.image = [UIImage imageNamed:@"woodenSword.png"];
    
    CORWeapon *shotbow = [[CORWeapon alloc] init];
    shotbow.damage = 14;
    shotbow.name = @"Shotbow";
    
    CORWeapon *runeScimitar = [[CORWeapon alloc] init];
    runeScimitar.damage = 22;
    runeScimitar.name = @"Rune Scimitar";
    
    CORWeapon *gravityGun = [[CORWeapon alloc] init];
    gravityGun.damage = 42;
    gravityGun.name = @"Gravity Gun";
    
    NSArray *weaponsArray = [[NSArray alloc] initWithObjects:none, woodenSword, shotbow, runeScimitar, gravityGun, nil];
    
    return weaponsArray;
}

@end
