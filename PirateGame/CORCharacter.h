//
//  CORCharacter.h
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CORWeapon.h"
#import "CORArmor.h"

@interface CORCharacter : NSObject

@property (strong, nonatomic) CORWeapon *currentWeapon;
@property (strong, nonatomic) CORArmor *currentArmor;
@property (nonatomic) int hp;
@property (nonatomic) CGPoint currentPosition;

@end
