//
//  BackgroundSprites.h
//  spaceship game
//
//  Created by Meirav Shapira on 11/6/15.
//  Copyright © 2015 NOVN. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameObjectNode.h"

@interface BackgroundSprites : GameObjectNode

-(void)update;
-(instancetype)initWithImage:(UIImage *)image loops:(BOOL)loops;

@end
