//
//  CORActionFactory.h
//  PirateGame
//
//  Created by Cor Pruijs on 04-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CORArmor.h"

@interface CORActionFactory : NSObject

- (NSArray *)getActionsArray:(NSArray *) weaponsArray armorArray:(NSArray *) armorArray;

@end
