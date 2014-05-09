//
//  CORAction.h
//  PirateGame
//
//  Created by Cor Pruijs on 04-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CORWeapon.h"
#import "CORArmor.h"

@interface CORAction : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) CORWeapon *actionWeapon;
@property (strong, nonatomic) CORArmor *actionArmor;
@property (nonatomic) int healthChange;


@end
