//
//  CORTileFactory.h
//  PirateGame
//
//  Created by Cor Pruijs on 03-05-14.
//  Copyright (c) 2014 Cor Pruijs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CORTile.h"

@interface CORTileFactory : NSObject

-(NSArray *)getTilesArray:(NSArray *)weaponsArray armorArray:(NSArray *)armorArray;

@end
